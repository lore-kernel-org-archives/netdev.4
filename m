Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619467;
	b=CMP1i4MMVIZKAvUOvW3Y3QeSyWx0zfGEPm0Neg1d0OeGVXieD9nhh4DHn66gF5wk2eId
	 2jNQruhm8HtFZ5LxNLQteb1mgEvyT12BPwzen7x3UTaNtBzu3LVnusKIlHsIr/zH/1fOr
	 1aINZQlSs849DdubUqvkbAqvjVm0sHr/C/QFt+wiDHeM6UvFDSHbY8S+ZcB1Rt1kO7Trh
	 lH7w44/KvF3idCwUPzoZ28zOXyoXERIabhE1TVhfcY+aM8I5sV0wiH1ST6f+L2dHhrrEl
	 64zb76MiAn9BDy9BRTwBGjH9sLQB5p2oil9jJkUAaCGgnkv8h9HW/C50oYnoJE86+qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=YuVk7FWWt2a2HgFMOsP1OlOGIeISBf3PZud268awzIs=;
	b=fmsvX0yXL+XpERNP6OF4IQAEEtuxbroJBGkLUMdMOM57AqzXA/HKVoJM4mreQlKX/PWe
	 WKB0Z/73LW/Hg6BGhDFax2hsZLfDoluJ/q2ZIvE1Dfqojq/KSz1nhep4fdaSpLZ4DdMCF
	 dCESbbhBfThmtWxLGhiRmsPvRROD2396QI1oMvT9ET+vFls8Orz0DObL8p6fGM9MAoCHS
	 tyr+T0V9cDTPRPHOGrJ9zBfXocdPSPR5LtMIYd15sWxK9J965UFQI7aw8T8VPmwwp1mCy
	 4hhALOmEe4x7mBTSmLb4idiY7qCOqmSkEXpp4/andBOJhvYRUlrD+aK+Mu+xmkUytlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rbox.co;
	spf=pass smtp.mailfrom=rbox.co;
	dkim=pass header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=FWhQ+OAU;
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2455F606A693
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 15:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2455F606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=FWhQ+OAU
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1xWEe8-009RvI-6T; Wed, 25 Nov 2026 16:10:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=YuVk7FWWt2a2HgFMOsP1OlOGIeISBf3PZud268awzIs=; b=FWhQ+OAUsGgkL/eYfiOLnuFkTG
	Sz97d3d7RXubh8QvyZ8heuEk4ixRbHfNNLhaUupgSHqZPrSr+gIwFD1QaDEzHSoNS7ChmXWe28ReR
	ZodHLx7zEyJT31KjdULG1Oa3Hq7h8cbAajd3WgbarqCHLWF7r3hToY6xE2xVJSK9kBdwQa7RoZnEP
	oZUahagwYS4CdEGlJJPb97fo1yRADvFWNx9as1CD3PyrnHi+FO0t7yxTZqZhV41E+Rh68d6w0Whfg
	6sHVbEPaaois8e0z79F0TYtmsUd9e/NvKL4ZjfDjjZ8mJ0e78h2jpidxD2J6CqRfiDVVV+N/7LbZP
	heA0YrKg==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1xWEe2-00084M-CK; Wed, 25 Nov 2026 16:10:50 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xWEe0-00B1cT-4T;
	Wed, 25 Nov 2026 16:10:48 +0100
Message-ID: <23a40881-5e6c-4c4e-86c3-97f3500438e5@rbox.co>
Date: Wed, 25 Nov 2026 16:10:47 +0100
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
From: Michal Luczaj <mhal@rbox.co>
Subject: Re: [PATCH net v2] vsock: only undo SS_CONNECTING when connect()
 fails
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, George Zhang <georgezhang@vmware.com>,
 Andy King <acking@vmware.com>, Dmitry Torokhov <dtor@vmware.com>,
 virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kyle Zeng <kylebot@openai.com>
References: <20261117-vsock-connect-close-v2-1-db5388323770@meta.com>
 <ed28d36a-682e-4db5-abf4-1339734e7c57@rbox.co>
 <awTJ8EOl52W0ph1K@devvm29614.prn0.facebook.com>
 <ca274ecf-3525-4bf0-a525-0460b5ea2d28@rbox.co>
 <awX2oDI/Mbt+z6J2@devvm29614.prn0.facebook.com>
Content-Language: pl-PL, en-GB
In-Reply-To: <awX2oDI/Mbt+z6J2@devvm29614.prn0.facebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 21:42, Bobby Eshleman wrote:
> On Tue, Nov 24, 2026 at 05:17:56PM +0100, Michal Luczaj wrote:
>> On 11/24/26 00:19, Bobby Eshleman wrote:
>>> On Sat, Nov 21, 2026 at 07:32:15PM +0100, Michal Luczaj wrote:
> 
> [...]
> 
>>> So the attempt never times out, and a late OP_RESPONSE connects a
>>> socket the user already shut down, overwriting SS_DISCONNECTING with
>>> SS_CONNECTED. I think that's a separate bug for a separate patch,
>>> though.
>>
>> Great, I'm all in favour of consolidation. So in the scenario above,
>> invoking vsock_connect_close() on vsock_connect_timeout() (with sk_shutdown
>> check dropped) would result in CLOSE/DISCONNECTING, and no more late
>> virtio_transport_recv_connecting(), right?
> 
> Right, that late response will fall through and get an RST back.  I'm
> not 100% sure yet about how to rework the sk_shutdown check yet
> though. I mention TCP's approach to shutdowns in my reply to Paolo and
> I'm thinking thats probably the right way to go about it, but not 100%
> sure yet...
> 
> Do we agree that touching vsock_connect_timeout() should not happen in
> this patch? Is there anything pending on this one from your perspective
> Michal?

I think we're good. Patch fixes what started the discussion.

And if I get this right, the only unintended side-effect is that
shutdown/connect inconsistency, but the sibling thread concludes shutdown
handling needs rework anyway.

Reviewed-by: Michal Luczaj <mhal@rbox.co>

thanks,
Michal
