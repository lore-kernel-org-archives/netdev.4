Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918386;
	b=rX5T+fsSP1giKK/Q47lNw/a4vG01gsjFJWiJKETX24sjI9tzdcrGMx+u0BpHYKxiQd9r
	 ebOpCgu7laZy27+TvVBRRhy8HxDAr9Oh1xXKBPBmF0mPTuP1KXkFYX0mjXMiOeq6pe5H6
	 IEAt+ecvNwjgBq6P/Vz/79hysWXAO9NUjWgF6jQX7SZqMttuhJZijsY1o+YFJyWEzHfQe
	 mLc5M3M7gmgVdcHklmsIBMMRy4rZzujMvoLinOnII/SDCRwsmO8XrGyXCSeMFqJQagEPZ
	 AJYv7/rAvCJNrbrbeefgDhQOda6sElOfLPzfG8zkEw7FnLMb1TSLPDiAxhIhdPykHoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918386;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JhEF3QYgCBT5k7drshdDG8SKBLfKYdoUoRI0T7Kouwk=;
	b=0wMzBK2n2a+b+un+fuNmHiBwnt4OJ8lyi2qzU9Wg+2pl8t4QyCwvG4j9WDCDdI5irxsI
	 2UmQ1T7tnPOinMu5igv6kJG40wEYtQbKfxeZo0n5siDaKFUUALvWlIioXXQXEJmIw3bec
	 s/N2IdHfPmYquMzMd4zqTo2qumy2xfvGpk/1H+IlC9eH9E+W/Zk1N9soqK//9FrkwSbLU
	 BxWjYbs0FjjTdOGDPx1kxORG0hcgbacdo8mBFMNp1FPPRcgV1haNuAzZK/f0XqMxnXnZV
	 Q0rm7D8vqIYT65vwlDmHBJ3iV2cYmcAFVQMTQTHrayQ5W18Sgi16cvyRO+/tvfwbnwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Re81gehC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kMlQjMZR;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AF0606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93AF0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Re81gehC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kMlQjMZR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794918384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhEF3QYgCBT5k7drshdDG8SKBLfKYdoUoRI0T7Kouwk=;
	b=Re81gehCZ1PHaOLfqlohfNTAeFiyuygY7XqGFzmmtBbKKDws/IXQKiBjM071xinvLcYodu
	86jH6eStHehKFzeNjdffLWhcNPf3YO3Xv/Cxuca86yI8H5wnEt1cmdayiuY59LHh4MqMa8
	PfZ5ujOTHOfUfJdp/8Tv3riUwWMy3X8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-qyEihSnnP0yJA5mKLcNYhw-1; Tue, 17 Nov 2026 07:26:23 -0500
X-MC-Unique: qyEihSnnP0yJA5mKLcNYhw-1
X-Mimecast-MFC-AGG-ID: qyEihSnnP0yJA5mKLcNYhw_1794918382
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49febef74e3so5885905e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794918382; x=1795523182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhEF3QYgCBT5k7drshdDG8SKBLfKYdoUoRI0T7Kouwk=;
        b=kMlQjMZRPNKwDSBOc0UKGjFqWKovOS4kQi+mgEaat7pWWMkcDrZK7TRi6M7Zx7zM+O
         Yh5FUFkna2FhLd0/IdFTI+oUnRgHKqB19EeNiDaexVxGefFNU9bEh9RQFP1p5fP700oa
         pjB0ZZU5NUo3Qi64+JRTFBHMq7qfqhtg4nR7NsL6TalPPdap67dbmK9q2fJT4bOfI8f4
         57nkIIe3Ep4F0k+7hiGIojibIGRaZNRAxbkHVE2DxsqUrU+mpcO9JR++oZsh1KOvw0NV
         FjW+uV+qPus2NXgPNEG4ll7q7OheD1tx5CON2XXc6qbuBRmzRlqWE3egBp/FcF+dxMJm
         XBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918382; x=1795523182;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhEF3QYgCBT5k7drshdDG8SKBLfKYdoUoRI0T7Kouwk=;
        b=A8FBDZ+d/jfczUzIf4v9T1wQZJeIkgNWTsRgea6x45PeZFcmkvv0CXYqLxmCuEkwpT
         VIIjAE+fxT6z+6iegH5im3rapvn05P2t7B5Eq2jo8hVQHJYf78SD2CeriloYUMsD2iRj
         y6lu/P9LGX1ZWGXNbZckXPIMW/TPzF9W1DTermhang0X27hq+NcGWbQ1bmhpKFgLJT//
         JzFMU0vY2JMyG3/jE+W+jARvBdmS0eFxrD7OGZl4e8of9UyAzRp65vPeS1nGyx2pdhMH
         9Z7VVrUGTjMRcmPA6mQ6mtK8BwZSmIHpSfOVkkATj/os1VmaqYwwn30GQl8djuPhxFxM
         9qKQ==
X-Forwarded-Encrypted: i=1; AL+hErGWWMM1Yy4HyniuFAYkXclnPfgwCWq32sFO6qnOQR/ICQi7+TPtijUjiaKRi42jzgPn3jJ4rcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IVlGy4NDGzeR34zxgfY2ww4AYsfXeEWh6cxu8YdEiM5c/yQOG
	C8gzSSSn57dL/N+HI3L74Uo0wPeDE2xyssMwk0EkdVlRkWraiXdY9+lL8mTPmV8ULh+SZFJXzeF
	AxOI4M08+WK+BWpr/AsvE4LJ5mc/V4uMkUWnXVm41NjEK9XNdtxWhh8bK/dvFjMt03g==
X-Gm-Gg: AYBFou0QQ7O3JnYmdZVOOYHBldDnssIWjZZkkN3AU7gPtYbn0Ehh+hIYEEum9xdlVQg
	yDx7ysGZAyUlpkGicEba10EcxXb9ZpyKSD8v4SGwbreK64MY5nE6P0tkgjdj3b1VqZUwUe2rGmi
	HLlFVXE26LqhTCjgJxzkqmxco3N/EVMiWP4DI3sn4Lm30EGIxsm92KK0H6MaHebhRhtxba4XXNk
	BUj70UK6PpC9M67/iDsLlhuvecReMuIWG9A6Z+QyMBRKVzKDhdMhaquwZ4YpZXqw29tgF9FawX3
	scehle8PLokcqV4/GmW4Yz1dyM4D5leTP+S28xWiYv0Dft3cpzgNrJ7ECWDYaM4H9XZp3r0vns1
	3nu9ZnEnsUmjmWFEktuTSHVzeNsPG7OkWzOsbVKfAcsIWJH5sJQa35HZ80ksC/dK12tB7eqXngt
	wQcNMdUGrRmAeqdYVj+xGBW23myaSGe5QOVl1JCRSborHn
X-Received: by 2002:a05:600c:5012:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7837264cmr54139415e9.3.1794918381838;
        Tue, 17 Nov 2026 04:26:21 -0800 (PST)
X-Received: by 2002:a05:600c:5012:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7837264cmr54138805e9.3.1794918381402;
        Tue, 17 Nov 2026 04:26:21 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm114134115e9.3.2026.11.17.04.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:26:20 -0800 (PST)
Message-ID: <cbaa372f-6ec1-4ceb-a012-30eaac5ae8eb@redhat.com>
Date: Tue, 17 Nov 2026 13:26:19 +0100
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
Subject: Re: [PATCH net] ipv6, calipso: fix data-race in calipso_cache_add()
 bucketsize check
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org,
 paul@paul-moore.com
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Huw Davies <huw@codeweavers.com>,
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261115144508.71543-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261115144508.71543-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 15:45, Jiayuan Chen wrote:
> Issue found by sashiko when reviewing my data-races patch [1]. This is
> not a plain READ_ONCE() annotation like the rest of that series but a
> real fix, so it is sent separately.
> 
> calipso_cache_add() reads calipso_cache_bucketsize twice: the "<= 0"
> guard on entry, then the "size < bucketsize" test after taking the
> bucket lock. A writer can flip it to 0 in between:
> 
>    CPU0                                    CPU1
>    calipso_cache_add()
>      calipso_cache_bucketsize == 10 (> 0)
>                                            proc_dointvec()
>                                              calipso_cache_bucketsize = 0
>      spin_lock_bh(&bucket.lock)
>      size(0) < calipso_cache_bucketsize(0) -> false
>      -> else branch, but the bucket is empty
> 
> On an empty bucket the else branch takes list.prev (the list head
> itself), list_del()s it and then list_add()s through the now poisoned
> head:
> 
>   Oops: general protection fault, probably for non-canonical address
>   0xdead000000000108
>   RIP: 0010:calipso_cache_add+0x2f0/0x380
>   Call Trace:
>    <IRQ>
>    calipso_cache_add+0x4c/0x70
>    netlbl_cache_add+0x4a/0xa0
>    selinux_netlbl_skbuff_getsid+0x1ac/0x280
>    selinux_skb_peerlbl_sid+0x7d/0x100
>    selinux_socket_sock_rcv_skb+0x2d3/0x460
>    security_sock_rcv_skb+0x86/0x150
>    sk_filter_trim_cap+0x56/0x730
>    sock_queue_rcv_skb_reason+0x1e/0x80
>    rawv6_rcv+0x679/0xb20
>    raw6_local_deliver+0x1f0/0x5b0
>    ip6_protocol_deliver_rcu+0x215/0x9a0
>    ip6_input_finish+0xb0/0x1b0
>    ip6_input+0xa8/0x250
>    ipv6_rcv+0x14b/0x1c0
>    __netif_receive_skb_one_core+0x8f/0xe0
>    __netif_receive_skb+0x23/0xb0
>    process_backlog+0x27a/0x950
>    __napi_poll.constprop.0+0x61/0x2c0
>    net_rx_action+0x372/0x800
>    handle_softirqs+0x109/0x570
>    __do_softirq+0x10/0x18
>    do_softirq.part.0+0x47/0xd0
>    </IRQ>
>    <TASK>
>    __local_bh_enable_ip+0xf0/0x120
>    __dev_queue_xmit+0x578/0x23f0
>    neigh_resolve_output+0x278/0x3c0
>    ip6_finish_output2+0x4b1/0xcb0
>    ip6_finish_output+0x2b6/0x6b0
>    ip6_output+0x122/0x400
>    ip6_local_out+0x61/0xb0
>    ip6_send_skb+0xa0/0x260
>    ip6_push_pending_frames+0x2b/0x40
>    rawv6_sendmsg+0x1b7a/0x2750
>    inet_sendmsg+0xa1/0xb0
>    __sys_sendto+0x2fe/0x350
>    __x64_sys_sendto+0x7f/0xb0
>    do_syscall_64+0xe1/0x450
>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> Snapshot the sysctl into a local once and use it for both tests, like
> cipso_v4_cache_add() has since commit dd44f04b9214 ("cipso: Fix
> data-races around sysctl.").
> 
> [1] https://lore.kernel.org/netdev/179428999963.994134.16904544500890053668@kernel.org/
> 
> Fixes: 4fee5242bf41 ("calipso: Add a label cache.")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
LGTM, but let's wait for Paul's explicit ack.

@Paul: please LMK if you prefer we apply this kind of
simple, clean fixes directly.

Thanks,

Paolo

