Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771241;
	b=bkblQKm1v8rV/2vp38K3UR+3ht4AaXdop7xRuMih7ADIwnYX0tQXF1aKEJ/NRnBn5ffH
	 2S+nmwmfpcZ8+Elljvo0qwZpmdTQapPutHF8DbL8L/x79s8yvNYwQkENdZl2wVwnog5rF
	 ss49DGyPgl+cBIx9siCOYJY1Ne/gSOiGtMlnZkAZfK9+aXtqK0mWcO35iMeNjDzyZNr1J
	 X88dFatV/4VIJcUeaVu+GcQg0wZjhTpekE+DzNNcA5fyZqUBeL8Uccmz5fxDhNGTChcCV
	 TqXer9aVwwNOnnS6r4FWpFkj+PMNio3IXIOgC6ypX6FmY6pIGQ2Q22KAIdYfOnEydcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771241;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/7Oro6stEyht5ylWx2OeBhdAP8u3/yZshWoQxNRbz9o=;
	b=NpVhhv3WU1EjAmg02Mdksw4ik3Qz3eq6DXusgD5r4PUjWgiJ6hcNt+7gWktRn5klXqVw
	 hDaRYkYHPxz/SEepL2zTmP8UhQexv/KisdxjeuWXsDoOt3nRgz/f12HBgG5zkAQDQoFPl
	 4W9x89zAqcmSu7IpMZhK3RwuDlJsW/bYEf18IDfurt4J5qzkKBi935I8ubD90kKi4qIn2
	 jpfjeX1G+PWGMxrZrIdnlztEGOfhL2YtnV+2zflepUaNX7cUkQkc8UEZhiyPHWlHuPXxP
	 aiMWit5SlwLe9nPtWtgqpC/PlDeEybfZWlSM/xvPv4ky8WQPyJnQGr9xPH8y3+HWuqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ur9fmHQJ;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3CD606A326
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A3CD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ur9fmHQJ
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5/yRDbbSamitvwmgETj+GShqjtr6n0Tqkzy+8FxqKRc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795771238; v=1; x=1796376038;
 b=Ur9fmHQJbiYGgYVO2RBEP2yt4dR4lJR7Dp7d0ronH15YG8aZObXZHh4xJRcXgPHhZSvd7XOX
 7j8NNCUOLzROybwithXsjnJERgQAUC41S/ohxNwM1dVcRazcHBccJXiw6aY8EFM46oBYsC7IwxQ
 +bo2BRK71j9RrvCwMY+GOSeQ=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b7fd4c2070e9fb12;
	Fri, 27 Nov 2026 09:20:37 +0000
X-Mizu-Trace-ID: b7fd4c2070e9fb12
X-Migadu-Flow: FLOW_OUT
Message-ID: <7f411177-8ecd-4411-8873-bb2ff232dff6@linux.dev>
Date: Fri, 27 Nov 2026 17:20:29 +0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/1] netdevsim: bound the peer TX queue index in
 nsim_start_peer_tx_queue()
To: Kyuwon Cho <kyuwoncho18@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <179528809256.2009509.5007624677973207521@gmail.com>
 <179528810243.2011658.9050974542546209152@gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <179528810243.2011658.9050974542546209152@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/22/26 3:32 AM, Kyuwon Cho wrote:
> nsim_start_peer_tx_queue() wakes the peer's TX queue with the index of
> the RX queue being polled, and only compares this device's TX queue
> count with the peer's RX queue count. When the device is relinked to a
> peer with fewer TX queues while its RX queues still hold traffic from
> the old peer, the index is past the peer's TX queue array:
> 
>   BUG: KASAN: slab-out-of-bounds in nsim_poll (include/linux/netdevice.h:3834 drivers/net/netdevsim/netdev.c:60)
>   Read of size 8
>   Call Trace:
>    <IRQ>
>    nsim_poll (drivers/net/netdevsim/netdev.c:409)
>    __napi_poll.constprop.0 (net/core/dev.c:7997)
>    net_rx_action (net/core/dev.c:8217)
> 
> Skip the wake-up when the index is not a TX queue of the peer.
> 
> Fixes: ff2ac4df58ad ("netdevsim: implement peer queue flow control")
> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>

Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

