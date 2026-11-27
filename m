Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771308;
	b=ppjeDV7RDpwziT13weXwHnJ6E7wMszPx13aecT3WNIGiBBXYi4ctsGjkukvRt8E+ZViJ
	 b9ZlvyF93I9i5TJV8wWhsnOZZDmeNb7pxInWRYzccaAXxkukW8Q0p5rNme+2VQcvcwpuA
	 1lX3GG/+nIJiy/R4pdotn+/uBj4uTn/WrKdsc6gh1CYPjn+P7CMo2oj/NKCEfMDvZctPG
	 AQEesN0tN64B/vKbNAT2hSXUEVK4emPbLhAQl6erOPiqpgLcrw1kbhaXCVKaOCEubVFp4
	 khmUT/Cb3t7k6mjhS5O9u/5jBHkGHfdeT514XKYsPKlqhvBWZfsNdjXg3vvEKp3rvbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771308;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=0E/HB4XTW7vp/uTJ9UtjtqwZ2GG8veKfz4kYsiwlpjA=;
	b=XfLIQzpOY8kjS6T0aIBXBvzPLfqgr5+4M7lBeeHq1R44/QKpYeodejlkfyb+kx5Dvn1H
	 yX8oR+Ikrks/nHarF/gVY2M866nxtnk58nC46sHbSazt36w7vAA5UOpberJ4plmipaLtN
	 3aAupLXKCUdZIVc3thLOWb05shcjxLy3W5/xKmOGfUy06nE9H2jenVj5bbwGfzHhPA3U7
	 k9+4BmSXvLhpr90aFzSMnlWmZD9nZj1w1uum1Vwbp2Yan2fbs3imVpMuKYT+DjBuWurPS
	 5MO/jazhOkeUkyrkmOPmboqx9eiJveDF+rTY7AQ4ltaxYv8EoEI7n8E6VulZjz2+K1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=SOkuM5DF;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E4606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A85E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=SOkuM5DF
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 6ECAF20849;
	Fri, 27 Nov 2026 10:21:40 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UwdPtv7kA7j; Fri, 27 Nov 2026 10:21:39 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id C77AB207AC;
	Fri, 27 Nov 2026 10:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com C77AB207AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795771299;
	bh=0E/HB4XTW7vp/uTJ9UtjtqwZ2GG8veKfz4kYsiwlpjA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=SOkuM5DFzqHMnHU7+OH+sOmyf5Dwwv88W8Ms119yNKBSYj1ES6ojSJhHV290T8fmi
	 YFlneRdFjs2y09lc3+mg+MAPKYz/eaZ/PbUTJDTchG3hHHYlhRrIzpXKIc59jDRJdW
	 Rm6qP9TCTQ6fuTBByapfPxkteEuarci15qnxHb313wJ7pgISsZjgsP8qf5tBHHWct+
	 Xys7Pjscrw+SWdNyQDZCcv/bdv9wDRUT0kvdm6SYqPKoiPMKHBvhnHS7rHEHYeVJXx
	 aHiP1f1DOCzq+yxLgeYUTbNKOC6aCL0alzcCx6kuNIvrhIa/WPn/M1UPCxDq/+tXY0
	 wvXSufd5Dy7KA==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 27 Nov
 2026 10:21:39 +0100
Received: (nullmailer pid 3464846 invoked by uid 1000);
	Fri, 27 Nov 2026 09:21:38 -0000
Date: Fri, 27 Nov 2026 10:21:38 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Zihan Xi <zihanx@nebusec.ai>
CC: <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <edumazet@kernel.org>,
	<pabeni@redhat.com>, <horms@kernel.org>, <sd@queasysnail.net>,
	<vega@nebusec.ai>
Subject: Re: [PATCH net 1/1] xfrm: espintcp: select receive path by skb
 protocol
Message-ID: <awlLogRS02zbcZJL@gauss4>
References: <20261116155229.318582-1-zihanx@nebusec.ai>
 <20261116155229.318582-2-zihanx@nebusec.ai>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261116155229.318582-2-zihanx@nebusec.ai>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

On Mon, Nov 16, 2026 at 03:52:29PM +0000, Zihan Xi wrote:
> An IPv6 socket can accept an IPv4 connection through a v4-mapped
> address. Such a socket still receives IPv4 skbs, but espintcp selected
> the XFRM receive path from the socket family.
> 
> Use the skb protocol when selecting the receive path so IPv4 packets are
> not passed to the IPv6 XFRM parser.
> 
> Fixes: 26333c37fc28 ("xfrm: add IPv6 support for espintcp")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>

Applied, thanks a lot!
