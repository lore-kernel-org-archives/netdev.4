Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008016;
	b=n+8M7Ne2M5DCNS6iRsaRb6uAUFFdKikWPiXikOrb9/uiIuqhvyDSr07XFjSjv0e8npep
	 dM/vwHcBaIcYW8Aa/Kyfrs0iUQqDoHv2UyYs74gqmM8st/H1KvhB1MAARv9rPkrftCYWs
	 CEo4/GSaGTu07aZmFL7o/Wp5c08llSMMtJyX2LHh3ofcjCEKYqNlwOlSbJQ9NBFFsYMr8
	 d8rDZrbHqy7pnjJZaaWW/Y68+3eOCWMZqUxXb3HcnNgwCVS8Hkw5LmPv2V1GS7dj1rVLv
	 nmdxVvUbqqeH0EnoDZjtEirBEU/arEPudKD/5Ky9hIUxGjVOQas8dyH5SrGt9SpIWPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008016;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kMAXamOkT/MBiaG2moS0N/Ds5wH2aznS0u0nK1cU+cY=;
	b=kJsJEJHk4Q1Sp/k4ViYa+aOvPigcFnZcmeXCmOIFd994vY9qy3TCFpt4MTR8VrxiaEkn
	 hwLpc3pUqZdd5qgQwRmNvhzf6I3uY+1SxaEgJ7Ya7dnLRAFryI4+TO96gVy11ZpXzmtgG
	 ZTsDtPOC8E3Qkg9dQOUMzRy+6ku8v2Y+ENkZ5rQhpTPLAhkrl1jEhGHSYNNSqJo9obgd9
	 eK6nTxO0QOYR+k5r1fVy/wMGErTi2dRxTckoBbg6OMpSaOm6CtWwZm/uak9RbdLVBlqi6
	 zC+BFTYSw8PaFqr68LebAZgxkLeEAuj4obFnmFsx57Uu1mj8i66nRN53S6HWF25l0bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=F+Mk0P6O;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01A2606A31C;
	Wed, 18 Nov 2026 13:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B01A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=F+Mk0P6O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kMAXamOkT/MBiaG2moS0N/Ds5wH2aznS0u0nK1cU+cY=; b=F+Mk0P6O6HH/R5a9R1T3Dx2pw+
	LK07FAumDw3YlzUrLsNwnjOSOHphea2tCYhi59wkiuiqUILBOojc9r2L4ki3ZYwvarcrmzUJLQQDF
	eNmzTL5e4XZhIYgEV/i+Ne7ktL9Nql3gjyuwyPqNCULGvGYHB1avRztnYD/Ux8E5mT8U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTfZv-00HQ7X-6f; Wed, 18 Nov 2026 14:19:59 +0100
Date: Wed, 18 Nov 2026 14:19:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Janis Edvarts Lacis <janislacis06@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	wellslutw@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <601a79c9-0447-4571-8590-998d02bf949e@lunn.ch>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
 <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>
 <461f7e59-6c1d-4ad5-9eb9-5e5d9b4a9e90@lunn.ch>
 <uscwfcie3wlbyljcowjvwhto7aecdid7cxjknvd4t6t4fyj5tt@lpyoijsxuduk>
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
In-Reply-To: <uscwfcie3wlbyljcowjvwhto7aecdid7cxjknvd4t6t4fyj5tt@lpyoijsxuduk>

On Wed, Nov 18, 2026 at 12:10:32AM +0200, Janis Edvarts Lacis wrote:
> On 16 Nov 23:19, Andrew Lunn wrote:
> > > I am fairly confident the change is correct, as the documentation
> > > supports it.
> > 
> > So the LLM review is wrong?
> 
> No, the review is not wrong. It correctly points out that the budget
> cannot be exhausted during normal NAPI polling in this driver, which
> I had missed originally.
> 
> It correctly identifies that the old code unmasks interrupts even
> when napi_complete() returns false. My change calls napi_complete_done()
> before unmasking interrupts and only unmasks them if it returns true,
> indicating that NAPI polling has completed and interrupts can be re-enabled.
> 
> Finally, it brings up some pre existing issues that seem to be appropriate
> for separate patches.
> 
> If this patch still makes sense as a net-next change, I will update the
> commit message to explain the ordering and conditional interrupt masking.

I don't think it makes sense since what it is trying to fix can never
happen.


    Andrew

---
pw-bot: cr
