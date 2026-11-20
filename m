Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134681;
	b=4vN/P6+6SorcjB6nBP3WBsK1tq+fFhFB03xU7WIPXXFYBnFRTDhret9GokyZ7BpLuJnQ
	 NFvPuj2JHg3rRZWgVey6K7YQPXHPjoU7E5CD6G6ohqPVfeVi9n0Z9qlSK8YS3wcZ8ko3L
	 1X3LApYR/FX7RpYQP6dF6GnqrJHboNnTerGaHG7qCXKnn6JMlkz7nWzgzevE3sLO9wC+o
	 pMud96xMzpcfLV8oSsNq096J9Df/h8T3DXGpgYmhNgkm4vSzB4le6rqKbqofuwxcrJG4f
	 +xvOVdit/0gw1VsE1gHkAuShq2B86rYwndLMybYEtJzGvCssfM4xui+Z25dDC6OggSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NJvteZs/7UwxXTsKI+K0BOVZAwYmYsNEfR3sXFomPaM=;
	b=D0mIXPIW63H8OSz47UO5h+EN4Tm1JQSfr1SHdQFWxILErk8mX6e5QAwSfbq2GEe/gPM+
	 5Z4jTR/aV6Dbb7UZFDyiHPcO/u0SYuq2ht0adBnnXVFtGMJdRotse/prnRRwN79gIU8jJ
	 3KleJe9DKbNqy8/Cg04hxnK5tYrem3gfkyMp2EbDHGQalaJoOdhgbXfc7uM0ZRmWHXbwc
	 io3C6rTFL/aE/0cb5vQ9XJJgoq5IFH+D1FVJqHQmQr/xd7AO1/5Ch9N8hnyisYFm3L1EF
	 iYHm/6+rpYznCe4DtS3x3hCtpW2KCybT57XK5EZa3QgpxUBSRH/ryQ7/E/d0uecVpZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JtKGSFFu;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC1C606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC1C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JtKGSFFu
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso230475a91.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795134680; x=1795739480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NJvteZs/7UwxXTsKI+K0BOVZAwYmYsNEfR3sXFomPaM=;
        b=JtKGSFFuZ37OqBXPbDHC1v8kICm6XKkcO5sFrHNQM4ceEFl4ENKQ66mtQ6mD4AyZNY
         U5vZo3qQm2BbdPVp24dPvclYKKKU1gbAtsICRk6SeO9YFUOgAczmBy2Om6Lt9vK/OYrm
         y1kLaGumQITlISvqdrmH84JEcdiq0Rb81AAURpGYrvUxfWKGnDccij2EtTG722TjzC/a
         0ZRxvc3jn+fsFnGSnV1gycG8QtUmUq9C9OZ904CxWwD5AhVJ3G+gb/TRIDBN3JCyYqdl
         IybEUtBNhGYaGVB6OWt/Y7EKtv/Bv5sAwX4p777McHQtKOUnToTmo3Y0tL85sLK9M/Py
         KzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134680; x=1795739480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NJvteZs/7UwxXTsKI+K0BOVZAwYmYsNEfR3sXFomPaM=;
        b=Fs06FDJL6ZvTv3bLApwv+XpCkv4HpoR7q9cCx5IVOMFE595DSM6h5cv2VRYBcfF8Fp
         Q1ESMD2FmqL1J1FV05ryUJ/D9cvZxymGQU9PEEu0ZzNP6i362Bx/q5OENanvUzeB31/f
         5NKO+vEwxtHDAN2kVlqyPamfswceXITD6ROtD6i7hgb0PEYC+/rKT2H2Xzm+rUJxl24E
         a3s6m38RvZg3kWUKipvHWAOc7iXq66/hI2AAlbB4iqHj1wNP8JXLsDdSKiE7J27WkN8e
         WfFkuzZrFFP3e24wOWhOm9svKdIHt9JDrxccv7iC5qaOdTbB7taLDc+RBMNknQDYYbNy
         xJsg==
X-Forwarded-Encrypted: i=1; AL+hErHeRnk/FEh72L5991JFZ11saNGimFC740KM1KGg1caF2LWHbQuSrrhPw8OHUmcVCHPHJ1OQdrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9caxkAlijzYTcvAKM/cDOzKdVVOu505mAOG1IfjMwqLvehQr8C
	wyienfOE4oE3k3dW0nj6GvOSYCgwcsPeBMVZYY6I1PujEK2o1raDyT3vcoK7iU1xQR9xPveDDgJ
	Cxjx8
X-Gm-Gg: AZFdTZeICo0514n+laCIs6CJ2HN5IraFpSQjAQRYR3ViViVWW8J0gRO85rweJ8kDWiD
	2fxngO9pkgK8Jpdak/33CYtO1JoWcOKKnFI/eG2AtmwwXK/SiIg20r3gomoVIsLFgZW6tqCWcnQ
	pPvIzlSish2jHA/V+sV5pLnv2Oel/aacn/9phSZZZbq7+Jl9Ks5B8quLoDqzghMwc9zfVxTlZ7n
	zGnXZrTfhErIrlzYYQsXGq+xVoPVk1EYlt51p4R+uoery/26SqIohxw+RxZsBssD3wWfZXDMWGl
	MF1HyFg0WQFGxZWD2G5seipXpaQWwIFo1C4sDEyttFoUOCyKXL46oaLcu/wvGEcxF226IzTwsTa
	Z0vlYDTI7TMMwEJJNkHhRD7dKMC9iA4VkHo1LgLT7hcUyCGB9k/CdwlPzccdeXXxJzjcS7szDKA
	FUfEM2lCXkWT89Bs5RekEXA3A6lfBDtkGIBrRKJglyODgZRF8QZopeiP5720PGtsidwsf78Mjev
	sAfz5r7H7xgCZ0iSTyJEh4wmrlgF6H9u+XQrwuJDfa9aWNLT+KLMSiF0H3Q8TQq2txEtE7dYaCl
	HYAO6fTHYBEwpozVgvjKSuqn1RHGuxV0vs39S64/BhA=
X-Received: by 2002:a17:90b:390c:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b41c9beafamr876819a91.66.1795134680373;
        Thu, 19 Nov 2026 16:31:20 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:55::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm1615819a91.10.2026.11.19.16.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:31:19 -0800 (PST)
Date: Thu, 19 Nov 2026 16:31:18 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: tariqt@nvidia.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Subject: Re: [PATCH net-next v2 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <av+U1gCrKGy+SuGU@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, tariqt@nvidia.com,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, daniel.machon@microchip.com
References: <20261117155353.2250540-1-joe@dama.to>
 <179493106742.3291.11434436383058043225@kernel.org>
 <avyELebAXqr4y1Yi@devvm20253.cco0.facebook.com>
 <20261119143852.3bca9000@kernel.org>
 <av+HfZSa40OFtF+M@devvm20253.cco0.facebook.com>
 <20261119160559.45b9fc7f@kernel.org>
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
In-Reply-To: <20261119160559.45b9fc7f@kernel.org>

On Thu, Nov 19, 2026 at 04:05:59PM -0800, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 15:34:21 -0800 Joe Damato wrote:
> > On Thu, Nov 19, 2026 at 02:38:52PM -0800, Jakub Kicinski wrote:
> > > On Tue, 17 Nov 2026 08:43:25 -0800 Joe Damato wrote:  
> > > > The only fix in this series is the deferred doorbell flush (patch 5), but I
> > > > need the other code (patches 1-4) for SW USO support I plan to submit next
> > > > if this series is applied.  
> > > 
> > > Not sure if this is what you meant but this may read as if you were
> > > sending a fix for net-next for convenience of sending more patches.
> > > To be clear - that's not a valid excuse. That said, here, we're talking
> > > about a 10 year old error path bug which nobody apparently have been
> > > bothered by. We don't have space in net for such things at this point
> > > of the cycle, anyway :S  
> > 
> > I'm probably just being dense and not following what you mean here.
> > 
> > I was looking at a local branch that implements SW USO in mlx4 and it was
> > getting to be quite long with a lot of patches. I thought that breaking it up
> > and moving some of the patches into a standalone series would make it easier
> > to review.
> > 
> > I suppose you are saying I should have just kept it as one longer series,
> > instead?
> 
> No, not at all. 
> 
> You said "The only fix in this series is....I plan to submit next if
> this series is applied". Which triggers my suspicion that you packed
> a fix with -next stuff for expedience / not having to wait for a
> net->net-next merge before you send the rest of USO. I don't think
> that's what you meant but since I had to ping Tariq anyway I decided
> to wag a finger at you. 

Oh, OK.

To be clear: I was not trying to circumvent the system or the rules and if you
(or Tariq) prefers, I am happy to peel this apart and send it to net in the
next cycle.

I am not trying to rush anything in; I'm happy to wait until the next
cycle if that is what is preferred.

I included it to net-next because my perception (which is clearly incorrect)
is that net is much stricter lately and issues which have never been triggered
IRL or reported by users may not meet the bar required for net.

I'll be more careful in the future; I just legitimately did not think this
change would be accepted to net.

> IOW I'm commenting purely on packing what can be perceived as a net
> fix in a net-next series.

Sorry for the confusion I caused :(
