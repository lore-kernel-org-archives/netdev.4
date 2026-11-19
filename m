Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132158;
	b=HbVjPJSgE4Q7O3mefgssuDqAFt9Tpk1WdO6oFBLE5fikGoI0lmeTaJPREGMsKduwvXcI
	 Ekvj1Ws8JVHcTTY/8TwM/jgBoP6vqwVhhngTJvoM+EwIEqWecqahklT4j0OYX1wv4SDiz
	 RU6XPq58x0Xe9eXlzLXpFGc9HEdqK6/3vPaJ3/z56jxpGXEUgmkCiy7WSvrNa1zlZ/yM2
	 bJd870Iy9+Deai1P0ibVLnrwZ0BlGTghUA5P5u1j1L6Kg+WNYy8qXzOT3JZcs2DWvDwF9
	 vmtlEDjwlHqi5pEhY6MeOCbz27gOr3+OmOwl1E+j1Odi/loMGK6HnYvDBOvmPIbfiZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132158;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kNR1Up8MMAGMqPRFE0m7nUGt5xM2SfBvVBbTBguOTeQ=;
	b=cZfPhNktwobaSm3GfAJWOU4s0+H+819q/r8ijBPty8NUg+d1WMKqVviS8DFVKkkaQyux
	 WZPzRoVhpugNoYbGfVAJtDoSyyyBlp3SHT0UBr0EA/3v9tZHQMcADlsdZT/XdoARgA6pn
	 BWi1HXDFGE0Sc/ek2b0FdzdQ/AgfMDipvr9Eo1C51VxOpGQYGrEDlN5BVTjX3qYXHnFkj
	 1gKKbJndrCd4RibIaHOEmeVneba5ePi2f1ACs8J9ETQkWm7RUN1IqS6TDNJgiyn2CZB8W
	 UZGYifKZHOOgAXHtfyY1wnCQldTytWvbtf3ItnuBdvPPJPPl3Dhr2ywq/tA7dWdUT9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AiYVT+X8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A1A606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 23:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AiYVT+X8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F7A1F000C4;
	Thu, 19 Nov 2026 23:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132157;
	bh=kNR1Up8MMAGMqPRFE0m7nUGt5xM2SfBvVBbTBguOTeQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AiYVT+X8n7R2nZGT6zgZqxC1TTssQuH5XVyWxovutG614XpYeSkrDTLi4KtWs+IVJ
	 WoTDNlDAHln1R6rYLAlqsrdRpjecZFNWedplEr44GYzwJXMy57NYMFGTI7Gj70zPA1
	 6e6nIxz2MrnWT2gcmOpjig5mov9QxFhFBypEXGo0N/t41bNmbMYK06KCwN3dGoT+9h
	 7MOROrjQdjNVlbnXu7j6qIeC3Mzm5EpVI3haZe1HFV87/vTzJ210DY5VmIfH8G2pQf
	 zXoUrwKQkcTNd/KHg0ueAGqjyCalHNB/b4bOrjSt9KJEo0hxpD9wgU0Di5IQYp7UXA
	 28q7SwoJKpJ1A==
Date: Thu, 19 Nov 2026 15:49:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Alexander Duyck <alexander.duyck@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, kernel-team@meta.com,
 pabeni@redhat.com
Subject: Re: [net PATCH 0/6] fbnic: Follow-up fixes for the Tx idle check,
 HW stats and FW mailbox allocations
Message-ID: <20261119154916.79139762@kernel.org>
In-Reply-To: <179460241885.8819.7179935130629202331.stgit@ahduyck-xeon-server.home.arpa>
References: <179460241885.8819.7179935130629202331.stgit@ahduyck-xeon-server.home.arpa>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 12:41:19 -0800 Alexander Duyck wrote:
>       fbnic: Wait for in-flight PTP timestamps before treating Tx as idle
>       fbnic: Do not accumulate HW stats from failed register reads
>       fbnic: Cover all of the HW stats with the stats lock
>       fbnic: Initialize and reset the HW stats before they can be read
>       fbnic: Stamp heartbeat and ownership requests after allocating them
>       fbnic: Allocate FW completions with kvzalloc

Don't think the last one would have been net material even before 
the LLMocalipse TBH. I split things up between the trees, hopefully
without breaking anything.
