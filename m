Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005654;
	b=2fdOOufWZ2W3etx3JamBqcbcO8pWKhvYhXg0vDkt1/jmtUHoW22y+KOGoZemdnKa2fAF
	 yXphye/4kBMWlfzxwnlNPAv8SaEzRCEqbJYsVem9nkdDgqfD6PQktFeDnZtn/Jo9EzFs1
	 pgCChmIjwYMBsU3WlTA4ANl7gxPYbS8spDePUjDMd925DXQozve+S26EM8Pi/Oa0b7MSB
	 Xunwk2wRIKERQfdznUvkuHEntrVLZn8mmDCleGpiYki1KbHrB2LkBT2ANPG2IB3QYAx9x
	 reJVjPjwhZvIt7HA9Gpc1czNJ0KWx5eilUlVs3mnT6EqJF331f1wh3s/JIb1wC5MFTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005654;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=+DLN0JMXOURk9LMg8DghKgivG2ddXrTqZRTmBWRD2Jw=;
	b=uq4NB8ip0TGf4i+mDug6hu6c004hqDT6Fu/3W04hw+fBtNUIYGEJFyX5FC1NYn3vtyqx
	 91qlYl3VLLYwKgELnGeNtg+RAbRs1ue0g5l0s6/WKZ0bQ5TC5khnjr4WPpZcmIwqvesZU
	 WBImPaRfiTN1LNTqNstPFv2LLoy+qimKTRySykxf4GqyvrKMp/fBpCAdr4gbemC8dBQpf
	 MrzsgWG1cJC3XVBP5QN2P8xN0/fztlJoOWRPcIVo8OQNDkwC5RpROr/4ZYU3HSf3FCe4X
	 00Ejij2eTTNW2IRaxuW8X3Z+W/IMC93fDqeUHUvVfoMPuxjRnHkmn5DSSa4quzr/Ejw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uI+UrJyX;
	arc=none smtp.remote-ip=91.218.175.72
Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FD9606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42FD9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uI+UrJyX
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+DLN0JMXOURk9LMg8DghKgivG2ddXrTqZRTmBWRD2Jw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795005651; v=1; x=1795610451;
 b=uI+UrJyXttLNS1sYG+bob3FLC3DmK3e754C0htpYNGq37gWu4SqvlQO9d/qdn3UyYaxFxSN3
 +Ntit0vhyZ20cOpL5hR3w55I7xbr64OTekpHjX74L7/SSAwfQheCSz7NwFMvesxoH9J5gXGsZ4O
 YbaGUlYWOY59oH8UwXL35cGE=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 715f28141b795e02;
	Wed, 18 Nov 2026 12:40:48 +0000
X-Mizu-Trace-ID: 715f28141b795e02
X-Migadu-Flow: FLOW_OUT
Message-ID: <8b1622a7-3494-4a0d-8913-c8cf4eae43fc@linux.dev>
Date: Wed, 18 Nov 2026 20:40:41 +0800
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
Subject: Re: [BUG] tcp: shift-out-of-bounds in inet_csk_rto_backoff() for an
 orphaned zero-window probe
To: Eric Dumazet <edumazet@kernel.org>, Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Cambda Zhu <cambda@linux.alibaba.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <179499954853.1440581.6627074959099619480@gmail.com>
 <CAL4WiiouZZ46QRp5K6MYK=vevKXYLzd_p049qVVf=w+9L8d96Q@mail.gmail.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <CAL4WiiouZZ46QRp5K6MYK=vevKXYLzd_p049qVVf=w+9L8d96Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/18/26 8:12 PM, Eric Dumazet wrote:
> Le mer. 18 nov. 2026 à 11:59, Kyuwon Cho <kyuwoncho18@gmail.com> a écrit :
>> Hi Eric, Neal,
>>
>> While testing v7.4-rc3 with an LLM-guided test generator that we are
>> developing as a research prototype, we found that an orphaned socket
>> that keeps sending zero-window probes makes inet_csk_rto_backoff()
>> shift by 64 or more. An unprivileged user can set this up in its own
>> user and network namespace:
> Thanks for the report and the reproducer.
>
> This is a known issue, a fix is under review:
>
> [PATCH net v2 2/2] tcp: fix shift-out-of-bounds in inet_csk_rto_backoff()
> https://lore.kernel.org/netdev/20261026123244.239766-2-jiayuan.chen@linux.dev/
>
> It limits the shift to 32 in inet_csk_rto_backoff() itself, so it
> covers both callers: tcp_ld_RTO_revert(), which is where Jiayuan hit
> the splat, and the orphan check in tcp_probe_timer() from your report.
>
>> We found no earlier report of this call site.
> Searching lore for the function name would have found it:
>
> https://lore.kernel.org/netdev/?q=inet_csk_rto_backoff
>
> Please do this before sending a report, especially for findings
> coming from automated tools.
>
> Note that the netns sysctls are not needed. tcp_retransmit_timer()
> increments icsk_backoff without any limit, so TCP_USER_TIMEOUT and
> TCP_RTO_MAX_MS on a socket with a silent peer are enough to get
> icsk_backoff above 63, then an ICMP unreachable reaches the shift
> from tcp_ld_RTO_revert().
>
>> On x86 the shift count is masked, so from 64 on alive can come out true
>> again and the orphan keeps probing instead of being aborted.
> Right, and this starts before 64: with icsk_rto == 200, the u64
> is already zero when icsk_backoff reaches 61.
>
> Jiayuan, I have not seen a v3 addressing Neal's feedback.
>
> When you send it, could you please add:
>
> Reported-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> Closes: https://lore.kernel.org/netdev/179499954853.1440581.6627074959099619480@gmail.com/
>
> and mention the zero window probe path in the changelog ?


Sure I can do that.

>
> Kyuwon, it would be nice if you could test Jiayuan's patch with your
> reproducer and send a Tested-by: tag in that thread.
>
> Thanks.
