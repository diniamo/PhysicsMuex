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

## Mathematical solution

While that was fun to write, there is a purely mathematical solution.

Utilizing the law of conservation of energy, we can get the velocities after the
first segment and at the end:

$$E_{k1}=E_{p0}-E_{p1}=mgl-mg(l-l\sin{30^\circ})=mg(l-(l-l\sin{30^\circ}))=mgl\sin{30^\circ}=mv_1^2 \to v_1=\sqrt{gl\sin{30^\circ}}$$

$$E_{k2}=E_{p0}=mgl=mv_2^2 \to v_2=\sqrt{gl}$$

If we consider the displacement to be $1$ in total (which is allowed for the
sake of answering the question, since it's proportional to the time), we get
these two expressions (from $t=\frac{s}{\bar{v}}$):
$t_1=\frac{\frac{1}{3}}{\frac{v_1}{2}}=\frac{2}{3v_1}=\frac{2}{3\sqrt{gl\sin{30^\circ}}}$
and
$t_2=\frac{\frac{2}{3}}{\frac{v_1+v_2}{2}}=\frac{4}{3\left(\sqrt{gl\sin{30^\circ}}+\sqrt{gl}\right)}$.
If we do some math magic, we get: $t_1=\sqrt{\frac{8}{9gl}\times1}$ and
$t_2=\sqrt{\frac{8}{9gl}\times\frac{4}{3+2\sqrt{2}}}$. All that's left is to
compare the non-common factors, which are $1$ and
$\frac{4}{3+2\sqrt{2}}\approx0.69$. The non-common factor in the second
expression is clearly less than $1$, meaning that $t_1$ is bigger, and therefore
the first segment takes longer!
