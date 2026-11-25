Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.198.224.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601203;
	b=k+nZMZ4BasJNu5h6LjuKNYVGYZVEdL/ahVAxJ9JIsoNyhUua0DitGwS1FlD/+I4iAFOV
	 xxCDuL12XTZy88EWElp60qKO9cdiqwFuAuvdbZfXAgP9x1YptYvR1azP9jf5cnqb3ngw/
	 MMFGjQphHXpuCIdlsOUcJ5AJJHxWc+cawbd3QecH1FS9jyKKEKfxTBkFvObvlxCwpVp0R
	 SFwGtmm6z3I+BPXmaaPeJNsigQfdlAh7YEWlBe8qcrKCH1ntcsWPcAE/2qjf3+RVEVQSn
	 HN/QGoa/rTxu5iwJBjP79bVG/DhaoAbHi6fz8PrrQ8DfPO1uwqXGlkckjT+ntrIdGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601203;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Received:Received:
	 Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Date:
	 From:To:Cc:Subject:Organization:In-Reply-To:References:Message-ID:
	 X-Sender:User-Agent:X-Spam-Status:X-Spam-Checker-Version:X-purgate:
	 X-purgate-ID:X-purgate-type;
	bh=Nb9j7n4VMoBo0nPcTqnB3tMTmYPQkVLcITR8atKeMWY=;
	b=jQqM9ztE7nUEwbZtg+KqAkmp+Tn8OMGMrRKP1wq2yK4mEpUGlTJ4ZtEaF78yLXk4OgOu
	 A4Z5AFco+S97yqqxfOGLNiQ1wcDJ+UG5LBEyS2tsAGTO0yLI4sxhoIQCNTW7ujqF8Wykv
	 g0E4I29GCyYme7j1WiDFx9Df1+caRaB/betBXt3pAcdxmZqdyxP5kgyi80T8ewJ6p15d0
	 4rybw8+ESc7hiR8rVne7pqFDIVdgaCA/Y779AeBSB8uX9DMor3OK8vNX4XmS+hyPyx+Q1
	 m8qegtm335iciYBUCrhHkBu9VpVavybGvPqFv2mwOuPLK9CofFM1Pl5rMfhjY1cQ4hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dev.tdt.de;
	spf=pass smtp.mailfrom=dev.tdt.de;
	dkim=temperror header.d=dev.tdt.de header.i=@dev.tdt.de header.a=rsa-sha256 header.s=z1-selector1 header.b=HYuSPXnR;
	arc=none smtp.remote-ip=91.198.224.70
Received: from mxout70.expurgate.net (mxout70.expurgate.net [91.198.224.70])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F347B606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F347B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev.tdt.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=dev.tdt.de header.i=@dev.tdt.de header.a=rsa-sha256 header.s=z1-selector1 header.b=HYuSPXnR
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <prvs=6803393a3a=ms@dev.tdt.de>)
	id 1xW9th-008TLr-04
	for netdev@vger.kernel.org; Wed, 25 Nov 2026 11:06:41 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ms@dev.tdt.de>)
	id 1xW9tg-003MdG-Ho
	for netdev@vger.kernel.org; Wed, 25 Nov 2026 11:06:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev.tdt.de;
	s=z1-selector1; t=1795601200;
	bh=Nb9j7n4VMoBo0nPcTqnB3tMTmYPQkVLcITR8atKeMWY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HYuSPXnRM2CBM1IbXAuD4yqDicVHktqHnTxWIqONZujCvug2JTbudY/7FCGhYoaxf
	 8AHixpF80OjtZEaiNB67/NDtbsSSVW0vxg3+srEWvZxvobVc8T/tBBcgmlvMwf1Tax
	 v3EpCJeK6gHvYH2s+NYZIxtRj9WIEVavRLlDMGUw1E2K5WcJkC/JCRvPQ3Ymk/KuMg
	 CeOX6z7FD/DuB1fzrveDdd/phhl4immNgF/mhT7QY7sEp+Py+5ek9e1MC5oWz+DMho
	 WswOmAOirkKDYMBpVJNgGrKr5yetSYfpWuVcP7teMP12+q1i6rDc6UINTbO0v4OAfX
	 NI52QcRmQqWDQ==
Received: from securemail.tdt.de (localhost [127.0.0.1])
	by securemail.tdt.de (Postfix) with ESMTP id 20526240040
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:06:40 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
	by securemail.tdt.de (Postfix) with ESMTP id 0E24A240036;
	Wed, 25 Nov 2026 11:06:40 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
	by mail.dev.tdt.de (Postfix) with ESMTP id DA2E929D20;
	Wed, 25 Nov 2026 11:06:39 +0100 (CET)
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
Date: Wed, 25 Nov 2026 11:06:39 +0100 (CET)
From: Martin Schiller <ms@dev.tdt.de>
To: f3lix.dev@gmx.de
Cc: linux-x25@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org, willemb@google.com,
	netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH net v2] net: x25: shut down T20 timer before freeing
 neighbour
Organization: TDT AG
In-Reply-To: <179559958721.3135.5593816176235018299@kernel.org>
References: <20261124093922.39573-1-f3lix.dev@gmx.de>
 <179559958721.3135.5593816176235018299@kernel.org>
Message-ID: <e9d12b5647f149f2133068c2b254afdd@dev.tdt.de>
X-Sender: ms@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.17
X-purgate: clean
X-purgate-ID: 151534::1795601200-38ED3C46-5566F8FF/0/0
X-purgate-type: clean

On Wed, 25 Nov 2026 10:39:47 +0100, netdev-bot wrote:
> Would it be more robust to purge nb->queue in x25_neigh_put() before
> kfree()? At that point nobody else can add to the queue, and
> skb_queue_purge() is safe in atomic context.

I agree. A socket that takes the neighbour in the window before
x25_route_device_down() can still queue frames after the list
reference is gone, so the purge belongs where the neighbour is freed.
The timer shutdown is fine where it is, as nothing can rearm a timer
after timer_shutdown_sync().

Felix, could you send a v3 that moves the purge into x25_neigh_put()
and documents the timer shutdown in the comment above
__x25_remove_neigh()? As the netdev bot asked, please also say in the
commit message how you found the issue and how you reproduced it.
Please drop my Acked-by for it, I'll look at the v3 again.

pw-bot: changes-requested
