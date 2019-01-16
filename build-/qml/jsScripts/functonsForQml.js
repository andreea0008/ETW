function releaseStack(stackView){
    if(stackView.depth > 1){
        stackView.pop()
        releaseStack();
    }
}

