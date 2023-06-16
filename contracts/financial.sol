pragma solidity ^0.8.0;

contract SimpleLoan {
    address payable public lender;
    address payable public borrower;
    uint public principal;
    uint public interest;
    uint public dueDate;

    constructor(
        address payable _lender,
        address payable _borrower,
        uint _principal,
        uint _interest,
        uint _loanTerm
    ) {
        lender = _lender;
        borrower = _borrower;
        principal = _principal;
        interest = _interest;
        dueDate = block.timestamp + _loanTerm;
    }

    function fundLoan() public payable {
        require(msg.sender == lender, "Only lender can fund the loan");
        require(
            msg.value == principal,
            "Must fund the loan with the principal amount"
        );
    }

    function repayLoan() public payable {
        require(msg.sender == borrower, "Only borrower can repay the loan");
        require(
            msg.value == principal + interest,
            "Must repay the loan with principal and interest"
        );
        require(block.timestamp <= dueDate, "Loan is overdue");

        lender.transfer(msg.value);
    }
}
