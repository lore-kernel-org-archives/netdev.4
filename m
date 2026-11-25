Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579890;
	b=QqPbp4RuBnClN0G0WRoGJHOuCJUXjwWPUc/2/KrneX5HqO1188/qbKISjQWWSphw2oSp
	 ASNXb/XCvP40PFsCU0TyhZsGKK48YjYqOj6Kb/57sjz1w5D/7iq27rXjAVYv29TM+fw00
	 3P+MSLsIT4OGX3FRCGvaU/Z6AQQNdf8kBwG5j/6xwXIEgXJuOknE22lQek0HHlf7VlQOW
	 5Mnkar1yr0WtvknJ3qaV2aDBEbfpos1j53N5PYLWf/TT39QNZwpi/arT4m1SfZUjIHzIJ
	 QGLfHKdHGq2Rxdmq+1yDV2g6sRKAfyiaxCQIWAsH8Mftx6JhMlhb6fhjSkYWDaEJvtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579890;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RuWBxqmlNzoGpyn58kI2cHzyi/kIZ/Boh+P0A/056Nw=;
	b=rNotp8d9t+S/Ny5TVZhxTS+GRXa6WKmkbwulIGNd74IqJCDGRWIGrbNUOt3Ht7ypwz9u
	 1c0nOY9sEHxMKn5XCf5VVh4+1yQN5MhmHtUHQD0IvJNUdFeCcnmlWE1l5QQTbc+ze7d79
	 yKfneRSObqBjbGw+SmcvDgAlzeCgX0RmCWZpif1WHrgvD0gDGEBgjmitHE9/e1dfGUWSv
	 MqY6dJlkYeEgqtOmFAxQiNaVlowWe89jlsabkFGVHI/MxpU+xQjZ0owNefWaPhjPMqTab
	 KcPavmuEXGbHCP7ABH8rIb3KRqiFFdhI4jn0G3txjy5t8RHEfbRncNSkJuplM4DWdIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAFrcbIR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2C606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAFrcbIR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84F31F000D0;
	Wed, 25 Nov 2026 04:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795579889;
	bh=RuWBxqmlNzoGpyn58kI2cHzyi/kIZ/Boh+P0A/056Nw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QAFrcbIRsGdYvPZlmvqjwV1L0L4bKuzfNt0vaA8mVyUptjEgkdG7Umwv5ZYqm1Nyy
	 ++hPIjjGVGazwwZTX2PJnoc+dhQoGvRHwv26UPcZTH3lDK7W1v04oDezmYyci1G/cI
	 eXfu7GItZGuw3JO7awgmvZvsktBM8gfPcNsCsFiypKr49yCfi3btwuZ+aWO/r7th5K
	 /edZlXI+CU/Fz9/DZFbTgibzG6c5BT2Y6V862haX+XgQXYNdK9yKUs88/thWeG+B+o
	 ZpWS0K7itBJptHAn7wsW4mSop6mWj09LoSmUyhT7k2p0IZVa/SbhmMgNFC9Nea32Px
	 o/hLtFabSV1YQ==
Message-ID: <f57bd1af-fac3-49e1-b0ce-4b980289fdd5@kernel.org>
Date: Tue, 24 Nov 2026 21:11:28 -0700
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
Subject: Re: [RFC net-next v2 0/7] ipv6: validate dsts against the netns route
 generation at lookup
Content-Language: en-US
To: Ralf Lici <ralf@mandelbit.com>
Cc: netdev@vger.kernel.org
References: <20261123212623.106153-1-dsahern@kernel.org>
 <20261124163553.783988-1-ralf@mandelbit.com>
 <72ade685-ecce-4215-a30b-25be7666e299@kernel.org>
 <20261124204623.45969-1-ralf@mandelbit.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20261124204623.45969-1-ralf@mandelbit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/26 1:46 PM, Ralf Lici wrote:
> On Tue, 24 Nov 2026 10:15:40 -0700, David Ahern <dsahern@kernel.org> wrote:
>> IPv6's finer grained invalidation of fib changes is why this whole
>> cookie caching mess exists. It is a performance optimization that to me
>> has gotten out of hand and as you reported is the cause of functional
>> incorrectness with both xfrm and other caching.
>>
>> I spent the morning doing a deep dive on the claude assisted patches and
>> really like the direction. Making ipv6 fib management and invalidation
>> align with ipv4 should remove the need for all of the cookie stashing on
>> sockets and elsewhere plus remove the cookie argument to the dst APIs
>> including sockets. ie., it is a good cleanup and simplification of the
>> code base with the cost of more invalidations on ipv6 fib changes.
>>
> 
> Understood. My goal is to get the race fixed, so if this is the
> direction you want to take, I'll drop my series. FTR, I don't think the
> finer grained invalidation is the culprit here so much as reading the
> cookie after the lookup instead of during it, and I still think the
> per-node scope might be worth keeping (v5 shows that it can be kept with
> validity in the dst), but the trade-off is yours to make.
> 
> Whichever way it goes, a few things I found while working on this apply
> to your series as well, some more broadly since any FIB change in the
> netns makes every pcpu dst stale:
> 
> - A found pcpu or exception dst has to match the lookup's sample,
>   otherwise a lookup can return a dst rebuilt after the route it
>   selected changed.
> - A replaced pcpu dst released with dst_dev_put discards packets for
>   holders that use it without validating it again, such as a corked UDP
>   socket.
> - Dropping the slot's reference with dst_release while an xfrm bundle
>   holds the dst as its child can free it under a lookup that read the
>   slot without taking a reference, as the bundle drops its own reference
>   without waiting for a grace period. 4/4 of my v5 defers the slot's
>   release with call_rcu.
> - Stale exceptions need to keep their PMTU and redirect information
>   instead of being treated as misses.
> - The forwarding sysctl is read in ip6_pol_route before the generation
>   is sampled.
> 
> 

My set kept growing. I told claude not to add the order switching; you
have a patch for that which can go in as is. Not sure how much of the
above list is covered by my non-RFC set. That one kept growing through
the iterations with claude and sashiko/codex.
