const GRAVITY = 9.8067
# In meters
const STRING_LENGTH = 1.0
const FIRST_SEGMENT_RATIO = 1 // 3
const SECOND_SEGMENT_RATIO = 1 - FIRST_SEGMENT_RATIO
# Per how many degrees to do the calculation
# Smaller = more precise
const PRECISION = 1.0

@info "Values" GRAVITY STRING_LENGTH FIRST_SEGMENT_RATIO SECOND_SEGMENT_RATIO PRECISION

# Returns the root of the positive discriminant
quadratic_positive(a, b, c) = (-b + sqrt(b^2 - 4 * a * c)) / 2a

# s / perimeter = precision / 360
s(angle) = (2 * STRING_LENGTH * π) * (angle / 360)
a(angle) = GRAVITY * cosd(angle)
# Solving (s = v_0*t + 1/2 at^2) for t
# We discard the negative root, since it's always a negative number, which doesn't make sense
t(v0, a, s) = quadratic_positive(a / 2, v0, -s)

function main()
    step = s(PRECISION)

    # Start calculating after the first step
    angle = 0.0
    v = 0.0
    t1 = 0.0
    t2 = 0.0

    while angle < 90
        ac = a(angle)
        tc = t(v, ac, step)

        v += ac * tc

        if angle <= (90 * FIRST_SEGMENT_RATIO)
            t1 += tc
        else
            t2 += tc
        end

        angle += PRECISION
    end

    # The last iteration happens before the object reaches the end, so we do another calculation between the end of the last iteration, and the end.
    # Note that this doesn't account for the case, when we should still add some portion, or all of the remaining time to t1.
    remaining_angle = 90 - (angle - PRECISION)
    if remaining_angle != 0
        t2 += t(v, remaining_angle, s(remaining_angle))
    end

    (t1, t2)
end

t1, t2 = main()

@info "Segment times" t1 t2
println(t1 > t2 ? "The first $FIRST_SEGMENT_RATIO of it takes longer" : "The last $SECOND_SEGMENT_RATIO of it takes longer")
