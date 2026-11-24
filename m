Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523519;
	b=oCAsOSLapPlIadCqHz7nfeB+60fT7G/x9xDUq8vav8CG4g75TdKF0Gj6pc1O79bX2yGQ
	 MxjADflND6Ivfwv4PZEu8+RkkLezHt7yKH7fxnr+t8VseoHAHugZwXGQz36t/AJKvxe+k
	 FyP1zghLgxpj4YPVIUHmAqpoAYMMAeqhHArxdTgvpXV8y7rr9haMXPqsAO8HY67/Txm4A
	 6u6iwGXBq05+Myjkbof5whY/WhPNoibQpq962gJlCo53r+l8etBb13z7pDa6MB+UgJg/F
	 0nt5CEzjMxu+Ilqj5oGekjtD2H2EQb8dPNQVDeY0u0tR4DQ3aHT19QBZB+zOMJ5go/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VAGi8ADLbe1nwsDdtMJUG+mqysismIkmi3QPANzknRE=;
	b=dqWJ6gtarfMqBaLdP1l14hL8LX2glLl424/oyo0zkq0K/VPT3ptR84e6ScIaWXvC4vzU
	 ndHBUj94i/TfGzxjXXd9aKDHMGhKI8iR4LeeYeBSRWBy93aSkk4Rynl1UKWgvchmLzpUk
	 E/jrDpFIfJY6OkJJBHJayDLubE6yuUkMORlNCzTZWwLU8t+EEOgJlezMw52OFIM2JtPLC
	 G3Z5Mf76BWY7s40de+vboPsW4H0Dkruyvb3DhYCXNwinNOBvQB/bFpzf0cf6jItwrZ5OX
	 moSvW4AlX6QIVxBYcfqhQGBFXqeeRdfPgUJ+f7g0KWTWYzu+7dV2dhIgL/re6573VGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjCUpmNl;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2325606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2325606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjCUpmNl
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so5071002a12.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795523517; x=1796128317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAGi8ADLbe1nwsDdtMJUG+mqysismIkmi3QPANzknRE=;
        b=wjCUpmNl+mRVvplDoEgumYPE3g2vqJKQo580YWEMbgKWCwgMLPfczJbnJxQ2Lx6fJS
         yMpi0u2vJaALSnXWBIHszPeiqA8DCjAM+BWjq6vY+ps/NaGroZjTsfuQgmP7K4h+36Qz
         tQUPmLxV+LEfU1HxNxDFfHAgAqiFd4ma61hQXlKn1wGEgaZaDUk6pSN5v6EIgXxgMe3t
         npl0OXnPrxY6k3giZUxQ58l7irS7XvjxWs1BVUZvTke76E5MjqYYNGj9HMBsQwvf+U3l
         9EdajxbwknzTCJQr6V2FnxbYW82Nsi7Bp338o/4kSx+7Bzf7mU9y9WbTXxn2OZQzyleL
         bErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523517; x=1796128317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAGi8ADLbe1nwsDdtMJUG+mqysismIkmi3QPANzknRE=;
        b=VJfG3nCFK8q1BpkdV6/VVVy4PP9mRLpqHIpbwyyjAuoLy9r42IYTSiHxMix4MPpUIs
         LQ+Bi0bkh/vrnl4eNxdX1yBUjZbocj+aIMWwimZaRic6MTHXHw4aCxDtXjv8MW9f/Jb2
         zN9xKqo9AJQ+L6gt2TTqBOM3kLTgjpXQB6ERyiPctDLcSE7JPJ5glMf+rIFqcY976vhO
         Ib+aHFNDWDOQko9KT8ujU9wcRzamij+dvSr6LT5XJFhslyLqwvFTGYHGvadVflTbWZZB
         Hols83TWD+AHKqnEM51zFB4vFggZHyCO31M+66WqxKh45AVoAXuhqcP8jo2Et3/DKnXM
         Dw8w==
X-Forwarded-Encrypted: i=1; AL+hErEe3MvIso/yiI9byb3j3nmp6Tt6wPR0Ewweta8Hw46nPhr9cMO3WAFH1c97R1D7lLI0UqCIw+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/swR2ZHDVIJadKQd413HN4eR3lfcvUcpKReTZU4GN7KdKSbtZR
	BXYxiDBcU66meh810kOp3N/1MLAaH5XuW3FAMDm6pDuDDFJtvatBV5qX
X-Gm-Gg: AZFdTZdhKAvhMThe5ZXNEk+1KjBEuTPVuTTtCYpg00dR9ynb0Ibq/7NtGIW7CxbTKbe
	245pxSAiq9PzNIuFb/ciWcuObgyGAcNzKD5MzF0gDxzWDU071CbqytwJXW/XYtOeQ/2/vEpBnc5
	t74xjR4v7HWRMfQgkWFe4Jiv44NQNaR/R6oKrUh3UGP26Rfjgc5lXEHz7jZyfXN0yeLDRgYPO72
	mq8cDqviFF5Ydtzfowq1ARRYhpPXyoNIjHWDdJrOfIN7SxIBjbYWWIhvLn4VvLTCQGnquhVBjKB
	ZRyLOkx4Dpu+Hjj9clUEVWS1Tpq5sXi3rfL4NkkwO5Ehd0euAYrBDdjYFqzc9xZs0YEADWtlZcJ
	DvehC7kRDwB0T0f8Gj4i/5JUBQQ+SjaHAi3HGOLfnDkl5SGDYKkE3FfHyG93jYOBVDWmAlChxRI
	8XjaIeiKYEznS7RzeTy85G959t+rKb8buUzrYmN/sBbKOKXKWxKNOGQJpALOGXPDItxRNv0jbLJ
	jTdbeUCtVAeCQbmrZs/C+vEkDNE7VydF9a47FXAVkp9PchEmd5xxDVa+Ixl7oJqfpwl1N0c+4Ul
	MEV5TJ1+i2vlpUySdD9K98fI4JWk/fcPR+VdUapviDp7QRQOpqLgbHTlNWWrvBV3SH4JVAQwh8y
	frYdRNV2kQV2MTCH81PccRQL05+GCrvqHUDSO2zrB92ykj/MSJ1S/jsDZSdOisH7kzs2ZY5WmIt
	zI62B4OSIADCitxfF0trY5PoSCCXg7EFHw8yqP9+ZmqUdBkp5GI6qiFAsZj9GFOu8=
X-Received: by 2002:a05:6402:ea9:b0:6ba:eb4c:487a with SMTP id 4fb4d7f45d1cf-6baeb4c48ccmr1907009a12.22.1795523516710;
        Tue, 24 Nov 2026 04:31:56 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm4675512a12.30.2026.11.24.04.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:31:56 -0800 (PST)
Message-ID: <02419845-bab8-4e36-9a98-6830761da1b9@gmail.com>
Date: Tue, 24 Nov 2026 13:31:55 +0100
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
Subject: Re: [PATCH] net/x25: fix invalid lock_sock() usage in
 x25_kill_by_neigh()
To: netdev-bot+sashiko@kernel.org, syzbot@kernel.org
Cc: syzkaller-bugs@googlegroups.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, linux-x25@vger.kernel.org,
 ms@dev.tdt.de, netdev@vger.kernel.org, pabeni@redhat.com,
 duoming@zju.edu.cn, horms@kernel.org, linux-kernel@vger.kernel.org,
 syzbot@lists.linux.dev, ngocthang2710.1999@gmail.com
References: <00f667e3-a158-4fb5-84a3-9ecda4718ce8@mail.kernel.org>
 <179551432467.3135.11868205229731190547@kernel.org>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <179551432467.3135.11868205229731190547@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 24 Nov 2026 09:58:44 +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] When the new softirq path finds a socket owned by a task, it
>   only sets a flag and leaves the dead call usable until release_sock().

Agreed. While a task owns the socket, the flagged call keeps its LCI
binding until release_sock(). __x25_find_socket() still returns it, so
frames that arrive after the restart go to its backlog and are processed
in the old state before x25_release_cb() runs. The owner can also still
transmit on the old LCI, and after a LAPB disconnect this brings the
link back up.

This patch follows the same design as Thang's patch from October [1].
In that thread Martin confirmed both effects in a test on 23 November
and announced a v2 which skips flagged sockets in __x25_find_socket()
and returns early from x25_kick() and x25_write_internal() for them.
That covers this finding, so please drop this patch in favour of his
series. I will not send a v2 of it.

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but it is still
>   reachable after it.

Agreed as well. x25_disconnect() clears x25->neighbour since commit
4becb7ee5b3d ("net/x25: Fix x25_neigh refcnt leak when x25
disconnect"), and x25_sendmsg() and x25_output() dereference it after
they take the socket lock again. Martin wrote that he has a separate
fix for this.

x25_recvmsg() has the same kind of window, and the review did not
report it. If x25_disconnect() runs after skb_recv_datagram() has
dequeued a packet and before lock_sock() returns, x25_recvmsg() then
calls x25_check_rbuf() on a socket without a neighbour.
x25_disconnect() does not clear x25->condition, so with
X25_COND_OWN_RX_BUSY still set and sk_rmem_alloc below half of
sk_rcvbuf, x25_check_rbuf() sends an RR through x25_write_internal(),
which dereferences x25->neighbour. I found this by reading the code and
have not reproduced it, but it may be worth covering in the same fix.

Martin, syzbot tracks this report separately from the one in Thang's
patch (extid 9faa82ae2e94c5c7d2ef). Could you also add the Reported-by
and Closes tags for 300375dfd44665f063a6 to the series, so that syzbot
closes this one too?

I am happy to test the series with the syzbot reproducer once it is
posted.

[1] https://lore.kernel.org/all/20261001150118.128470-1-ngocthang2710.1999@gmail.com/

pw-bot: cr

-- 
Krystian Kaniewski
