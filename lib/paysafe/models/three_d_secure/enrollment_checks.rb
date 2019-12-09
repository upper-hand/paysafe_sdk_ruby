<<-DOC
 * Copyright (c) 2016 Paysafe
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
 * associated documentation files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, publish, distribute,
 * sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all copies or
 * substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
 * NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 DOC

module Paysafe
  module ThreeDSecure
	class EnrollmentChecks < JsonObject
		attr_accessor :id
    	attr_accessor :merchantRefNum
    	attr_accessor :amount
		attr_accessor :currency
	    attr_accessor :card
	    attr_accessor :customerIp
	    attr_accessor :userAgent
	    attr_accessor :acceptHeader
	    attr_accessor :merchantUrl
	    attr_accessor :txnTime
	    attr_accessor :error
	    attr_accessor :status
	    attr_accessor :acsURL
	    attr_accessor :paReq
	    attr_accessor :eci
	    attr_accessor :threeDEnrollment
	end
  end
end