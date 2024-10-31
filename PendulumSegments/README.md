# Pendulum Segments

Imagine holding out the end of a pendulum exactly 90° to the side. You might be
wondering: when it starts falling, will the first $\frac{1}{3}$, or the last
$\frac{2}{3}$ of the fall take longer?

One way to answer that question, is by dividing the arc of a fall into very
small parts (e.g. 1°), and calculating the time they would each take. Obviously,
doing that by hand would be very tedious, so I made [this](main.jl) Julia
implementation.

Note that the length of the string can be any value, since both segment times
change linearly based on it, but it is still defined and used as a constant for
convenience.

## Running

1. Set the desired values for the constants at the top of the file
2. Run `julia main.jl`
