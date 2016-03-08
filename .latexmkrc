add_cus_dep('gpi', 'tex', 0, 'makegpi2tex');

sub makegpi2tex {
    system("gnuplot \"$_[0].gpi\"") ;
}
