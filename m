Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203104;
	b=hT0+V74ao9+tFoI9ACvNXyy0iDOGSIsVpgfyIx4u+FQrSE+du0m+F5SeKBluYjsS6nSV
	 j5/XuZ3TEPZh1VgNiO0GCHcOvyZz1/Fgix0+LQQYjvondshGOJmRirvcmAsEwBijfhEHy
	 X3LyL9wZCNf6/UAigrTSmBBbFlic1qtWzgrVsuxnIFC7Dyf1yCiTeWhEgd2x7gfimglpk
	 rlZrgtCLJMEahWgp5+/F8E/ZzWoZyDtAnQMkd7pUV5l+pSQA8orUDzxlfMSNsgc+WXjxG
	 BBitQhCHZFr1JZVzj/WbvBFtVc5qL1POtGJ1XWymaleLPFk2zHAdZ/AEqF0h3MhpcZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203104;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=6RbebtAHkTMdks6JM7wkHkadnEvODndEkvce6tfdZEY=;
	b=u8ydVqT6BlZNXO5M5EyW+wEZruILZgJRf0cH6hVaJSwB/w5gBGWmf0/+H4QsZ1HJKQsf
	 UyjSj8O39EZPFe/LyqmBZyzkqes4pO/7Ds5e79k/iqsIyOUa1qetvKgvwkuchrykxThjU
	 fiRCqnHxodr8o/tHPn/Nn8wOlHxMCoWPR9LwUurYFa1YZ5J2gDrZBWtOL1RqRubZD5ImI
	 CbR35MpBI/zpHvB8MnYhIlwbqIzA7WtNFwpjkWQC+u69taxsmX8myPAfr8QiMxk8Yfjf9
	 AzRvdUkUnbDdW5WRApSDZM2iQo3ZQnCY9a+/gbdlweZKSVTuxXIAF362ngMduJcD2zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=htnx6rj+;
	arc=none smtp.remote-ip=95.215.58.107
Received: from mta1.migadu.com (out-107.mta1.migadu.com [95.215.58.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3E606A6FB
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:31:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB3E606A6FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=htnx6rj+
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=izg7P6nX8r6l2L2/vMBeLH7bUoHOPu29cSNO4TbXPZA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795203100; v=1; x=1795807900;
 b=htnx6rj++Rr7MErW+/1LYqfkFtO/SqmKnZ5qf9U7OR7hJsG7KXMU3dYXRZoSgpIhh4EQV73y
 /uk64wbp0asip9lUA+GMOKPHTzdqM/joOMhfoXzF55g8BxZu3xlJwuYltrO7uYh3L6t5llLytVy
 3rWwC1NbKdYzP8I2LaJDx9Ww=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06043f85e0daad53;
	Fri, 20 Nov 2026 19:31:40 +0000
X-Mizu-Trace-ID: 06043f85e0daad53
X-Migadu-Flow: FLOW_OUT
Message-ID: <75abd6c6-f0ee-4665-9451-05e0e1a7a3d7@linux.dev>
Date: Fri, 20 Nov 2026 19:31:39 +0000
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
Subject: Re: [PATCH net v2 1/4] ptp: ocp: prevent timestamp rearming during
 detach
To: Ahmad Byagowi <ahmadexp@gmail.com>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
 <20261119-timecard-common-v2-078fe69f33-1-ahmadexp@gmail.com>
 <4e42134b-b017-4836-9772-9c1915b16e77@linux.dev>
 <20261119-timecard-common-v3-discussion-743fce65f675-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261119-timecard-common-v3-discussion-743fce65f675-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 23:46, Ahmad Byagowi wrote:
> On Thu, 19 Nov 2026 at 22:23 UTC, Vadim Fedorenko wrote:
>> enable() callback has to set PTP_PF_EXTTS function
> 
> Thanks. I tested the cleanup path. Recording an assignment makes the core
> disable that channel, but ptp_ocp exposes six timestamp channels and only
> four SMA descriptors. TS0 is the internal GNSS source and TS5 is the PHC
> source. All six can be enabled without pin assignments. Four descriptors
> cannot record that state without rejecting requests or changing the pin
> interface. extts_enable sysfs also reaches enable() without an assignment.

Fair point. Pins are pins, time stampers are time stampers. We have to
disable things which may trigger interrupts, the time stampers.

> Would you and Richard prefer disabling all n_ext_ts channels in
> ptp_disable_all_events(), followed by the existing PPS disable? That keeps
> cleanup after posix_clock_unregister(), without inventing pin assignments.
> I have prepared and tested that alternative locally, not posted it yet.

Yes, it's better to make correct core PTP cleanup function.

> 
> I also removed ptp_ocp's preliminary disable loop. Otherwise it can clear
> pps_req_map while an in-flight enable subsequently rearms the hardware.
> An overlapping sysfs/ioctl request can likewise leave an empty map with
> the source enabled, so the final disable now always masks and drains an
> empty PPS map. The shortcut remains while another subscription is active.
> 
>> why do we need it now?
> 
> The v2 teardown exception covered a disable that had cleared the map and
> dropped the spinlock but had not yet completed synchronize_irq(). The
> previous mutex version held its lock through the IRQ drain. This local
> revision removes the stopping flag and its special-case condition: core
> cleanup runs after active requests finish, and an empty map is disabled
> and drained regardless of its prior value.

Could you please keep more context while quoting? It's really hard to
follow the conversation otherwise

