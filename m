Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165623;
	b=Olz8Gl4Nk2vKupWR2rs8rZunN+QW5+2fgzMbBmBoj5BBiArltv99AEAGshPeqN+a0P5t
	 /GuvCCDqrJaKa408n6qj0i6j6/9kXvvjpWlGgnv+c0cGlsjHG8wWcc2WYurcFW9dEQJ8B
	 izgc/SoIsHr0qK89ouyUB+BsWCWMaVStm4H+HBHMyAu8i/xMxNtkam8xvNWrP8bxESZsI
	 tzRyCJEBjjn5gt0j2hkMbqwSJFwtJOXHdPdDBiVvOsX3FnOGy1Q+wv7iAFAO+fnAIS4TQ
	 lJ0RPxqJk0NCRzXDnPqMyrDjhqbq5IBuERLwdMdoJurOc1S/LGNloce/0/GAkxaVxBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165623;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=5iBovdVyASR72HwzqKbVi5bHAsPwTQzwOFXgFroJSN0=;
	b=fvgAhYg3PWtQ28ji4MEExr7evXOmj/+/ovAy1AmGJv29sRluCpa7t9ibI2H4uZijddfu
	 PwiPcK2AEcEw+AePI2Sis+U5suvWqQu2gFzm60oG6LngQnOPb3W/7q/19HTIvrzBYmaDq
	 5rg7m1aJkuZIqjgLhWL+FWD4oLwQW77LJzIvRHEHlWEOztDr9d4Vw7AT/K5mpPVlYgHt/
	 FBE79MXdjjV5P3AVotY+K4WFOoQOtQ6UUTpiSpPSEgqhrhRo+T7SLbO74zBPO6maNIPGI
	 4mEuGW61b54CGo7fuvgj5kTtetODv9iCbzCclly9kIRz6453bwkZ4wasPUkJXmZ+gZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3Qyr6mnb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aOrLKKz7;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C93606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3C93606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3Qyr6mnb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aOrLKKz7
Date: Fri, 20 Nov 2026 10:06:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795165620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5iBovdVyASR72HwzqKbVi5bHAsPwTQzwOFXgFroJSN0=;
	b=3Qyr6mnbLzo0oqVssHc+WyB0GdrbBixxLtv4KYGx3iEr+X1uXflRxSTDdIbjk04MDzAoRZ
	2oc1bOw6MKQvlrhKWmlWXglSJAyUtnQr1y5KqnTvnHP3jTJhTKpBf98LkDCOZRZ3N5lt/H
	ExmQ6sPPKmbsYe9lZc2Zh4JYfAc5bDqDZIZfje7rgQf/6xwwurrh0JaespZiC6Oylgc9R0
	qqL+MYHeJpKxwOg28VxbWT3MFfhnMw2BPa+NmPO7NnpKMKOf9WW548zINdPy3wF/Q2YFt/
	s4Dx3T/IFuMs933dywMbYaocvq13tUs6XE/lph0As9YVgFj51bVzHP5y1/vSDg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795165620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5iBovdVyASR72HwzqKbVi5bHAsPwTQzwOFXgFroJSN0=;
	b=aOrLKKz73w62xBJMAWqPzYglVFhWWwa8LR6e1/Mj9+LQ35rXdskIrmyOoSSo0+A1+lYCTF
	cS/WUfri1PxqYUAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: netdev@vger.kernel.org, "(JC), Jayachandran" <j-rameshbabu@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chintan Vankar <c-vankar@ti.com>, Danish Anwar <danishanwar@ti.com>,
	Daolin Qiu <d-qiu@ti.com>, "David S. Miller" <davem@davemloft.net>,
	Felix Maurer <fmaurer@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
	Neelima Muralidharan <neelima@ti.com>,
	Paolo Abeni <pabeni@redhat.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Pratheesh Gangadhar TK <pratheesh@ti.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Eric Dumazet <edumazet@kernel.org>
Subject: Re: [PATCH net-next v10 5/8] hsr: Use the port and header
 information in hsr_forward_skb()
Message-ID: <20261120090658.6rZGUWMm@linutronix.de>
References: <20261104-hsr_ptp-v10-0-2c4a38ad973c@linutronix.de>
 <20261104-hsr_ptp-v10-5-2c4a38ad973c@linutronix.de>
 <20261110132337.2h42rt4xh5h4dc3x@DEN-DL-M70577>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110132337.2h42rt4xh5h4dc3x@DEN-DL-M70577>

On 2026-11-10 14:23:37 [+0100], Daniel Machon wrote:
> Hi Sebastian,
Hi Daniel,

> > --- a/net/hsr/hsr_forward.c
> > +++ b/net/hsr/hsr_forward.c
> > @@ -570,6 +571,19 @@ static void hsr_forward_do(struct hsr_frame_info *frame)
> >  		if ((port->dev->features & NETIF_F_HW_HSR_DUP) && sent)
> >  			continue;
> >  
> > +		/* If this frame has a specific outgoing port specified (by the
> > +		 * sender) then send it on this port only.
> > +		 */
> > +		if (frame->req_tx_port != HSR_PT_NONE && frame->req_tx_port != port->type)
> > +			continue;
> 
> This could easily be wrapped at 80 to avoid the warning.

okay. I'm going to keep sneaky clean up and avoid the two 80s warnings.

> /Daniel

Sebastian
