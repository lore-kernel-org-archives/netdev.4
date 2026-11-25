Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592968;
	b=lKREBtmX0pdLQZOOSYNPHUpvh7IOsTPqTdCn3T9EpaKuBw//QRWzRyBr1IgthuDRnZrE
	 a4GPf+sopzqfsHCj+A8Ld870zlp7Ew2ffhIby+XMjvJTi18rJXrB0Th3qKRyU6VndHkSS
	 38KPOeKiuctKqvTlsgU8gRxlwHpLVgyprvxOHUcwmGie9f9HB5CUN0ycTEOp5nhRzNunJ
	 KR0Mm6O8SzRFV9MUXyqBnCFj7c8BkUicLLdMx3VbzpxP2UEkGXPPXkeAY1RolPRgEEWhj
	 ocD5piKMLVSiBmsxydxTGixQf8pWiXgHgqxRK142suYcAOJXM9+w8hFpTml+8z8nqaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XbkWYxcnakfZmA9T1+I7Na0TVwpp2fb1Ta7OHaIvM0I=;
	b=lgk+SGMMFA+1TmgWlB2tOojn9gINKxMgtZr/6leWDs9+HxBywHK+X5/yOdLbTj6T8+rx
	 SrYx8KB4DzJYFs2rn4x6K2ouMdgFUAG1bocxgOrVPJQeN/5/JEgfnwE8naJ2RguZdzf7A
	 kK4fAuOupI18Ww/7/Tg1gTL4W8EZWCe2GGLuWF894J7gXecGnujWCVzdDUemA+DP/yJv9
	 Q5xgHdR3W0vwFCby2GWcNeosoAnAU47KAEb1QqD9ioAB2paxWCjwi2iAdLp96j3w741Hn
	 7JZVD0bS6p8KnMxpWmYv5RCm6T5Iw9Pw9R4hnDv1rrzcWcAIfKMohOjzX+kffFlWQJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+0gcdtW;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DC6606A332
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89DC6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+0gcdtW
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38431138772so7016980eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592967; x=1796197767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XbkWYxcnakfZmA9T1+I7Na0TVwpp2fb1Ta7OHaIvM0I=;
        b=f+0gcdtWduOA98ocpZ4P6otkLCvczzq5SVzcJN944awqW2BkygzVvyoH8NnFAjOdDC
         NFW3hqkG7IECoi+jABlU55SYHKQ0pftH3nyRlALERlmFS0q7Pu2GY6ZD5BXZPCVMD9ed
         q0jgKCuk0GykdiPKK7dnysrp0HvR2Swlt+fyJgW75NECl5gRN/AtsBF/bwm/0UcFIfQC
         ZAOyEyQaUjbAYgykQJQ0PlmIoKy6xGeE7TxnRPiMhbVa/O95oNWm+3JF4qWA0xa/u8Cn
         SEwrM1F88/TeZZg0W+0lbdPsFFwi66oEcGXUJ34dVnaG0VjVHwH5oX5HNKyO83uAcnCS
         95bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592967; x=1796197767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbkWYxcnakfZmA9T1+I7Na0TVwpp2fb1Ta7OHaIvM0I=;
        b=0rK17ByNISH6fX+8PojoIiLpxlgME+FtG3sV7xBBhVKpw+zqqUJ8zeOe9QytZyQ/S1
         rPObp/FwwC71BREmVFVgSETRJXcBayxuscAgHVirHHY+2V6kC8tr5lpQCawT+m3i93+Q
         3fXtfE+kQ2ez+DD/NRopLOLA6Ot++ehZLaQHFMFnWw3FEMm2qoZehxhoUUJb+aIY2lIl
         BYueWqRmiz4+CkxoOTvF/BEuwi3S5abanP6YQ08p3YeLb3SEJMIzdMdfp/DKQ1sXeYLz
         Dcky1POYDiMhoM4tMc8+nrfvJocGIoRobxlw3XR4xwlUEAaqs6dWhg4BYgmVNnjLdO3e
         Wyqw==
X-Gm-Message-State: APuU4Z9nYz7jpGqHzmTMrNWAXPRo7u9uLhgJQ0ORX3U1IArJotgZK7r8
	bbOLteSvVVGR85GQYAZm5ApHCGytGFL9Yj/a4m3cRRl2ktQxGc5cAHWG
X-Gm-Gg: AZFdTZeDEqYJoGUPAvTHgtmpA2fWxS+Pr3HUgLISU2e4FgsYpmQlBr37k60/EfUr6Kw
	e9ztg6y/1IXTl9Nav1p7lkNEC8zFu6V4KoMMrJ9/jwzq6ALJEAiCIuhTLljBaz7byoj8S+0PAoY
	X3Tl5DMsk+GcP0qcqoxliyl13+bwVyyvMj+QIEIRWbg759CbfbThrvGgfeGwNNbVaRkiwVSusha
	1S7twXkFkMLl6Rb/q+dQAsbcXxrFEjAjxvpmvBcaKl7Qb0WirPDv5V5tycaLg1JrCrkYXw/TeA6
	xkbwot3jv15NoWr0Jcx/0Q1X0U3IOD0YVQvNfSrDztzfvILXg9CcQF1QOq/ADXVQV6VUo4sLWNZ
	fFm09d1F4Ou36htkIPFlulOILxk0zRQoqPNR+UpvW3Rpl9D+uSufJe8NPz9dCOvi/felULfA9mR
	1dsTYHx01POecZVWyyCyb38cxF9UpXA2v4aIAi8WIPmN1AJ7RS5t2+PFR5ZgCdeMWKzcIPbqoZq
	E60BMLYkV7W/HudAKSVn9QyWdYRmkl8Gud95MT7v4q0A/Ff1cP7k7xbnTA5vBX5xIY681DMlKaQ
	wxkDgLfgIWiYJRgKnhClP9woZN4n+mjCbg6OdF/L1FC3QbgUNKA=
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id 5a478bee46e88-38571510675mr19309829eec.33.1795592966558;
        Tue, 24 Nov 2026 23:49:26 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:40::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm9502217eec.17.2026.11.24.23.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:49:26 -0800 (PST)
Date: Tue, 24 Nov 2026 23:48:56 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Joe Damato <joe@dama.to>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, edumazet@google.com,
	horms@kernel.org, narcisav.kernel@gmail.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] selftests: drv-net: uso: check datagram
 sizes at the receiver
Message-ID: <awaS6Koc55ducrm6@gmail.com>
References: <20261125013838.3823834-1-joe@dama.to>
 <20261125013838.3823834-2-joe@dama.to>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125013838.3823834-2-joe@dama.to>

On Tue, Nov 24, 2026 at 05:38:35PM -0800, Joe Damato wrote:
> The receiver only checks the total number of bytes received, which is
> the same whether the peer gets one datagram per segment or a single
> unsegmented datagram.
> 
> Run socat with -v, which logs the length of each datagram received,
> and check that the peer received one datagram per segment with the
> expected sizes.
> 
> Signed-off-by: Joe Damato <joe@dama.to>
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  tools/testing/selftests/drivers/net/hw/uso.py | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

Reviewed-by: Narcisa Vasile <narcisav.kernel@gmail.com>
