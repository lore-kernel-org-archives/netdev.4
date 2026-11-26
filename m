Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709409;
	b=RNzEgv3sNF59lp2ihUoMM17wxpLoZyicoNv1HKQDpYipIcduKB/RjEv8U24bTCEybClu
	 cqLH8TMGYdvvMZKbN6MFjCEKbPg+EZpLf20TgzWzB0OYkhyRgt+wU1nPL8ejCzUKbQiGh
	 ILO/mpieCK2MR9mX+qvi1b0KLyW4IR4mrD044sHRYoWpXMixYRVW6Baow716oFXbUIjtW
	 /KJ8RrgWnfSkkBibFqE7yFuwwfaA10wdFGOjN8QF8Nv9TGrjvcKQQH6wk4jBhKqhNeNph
	 ssIhU3LGrq7VEUSR1d7egBWeyPgOjbhVIpOG0rIYg0CTqtkx5RC+2qKML7bhc367sHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709409;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wxm0q+9pqrQa87GpYE9M2lUimiUIeR4Fl+shQ/7gsqI=;
	b=oxCso0eyOezlDQxgDNj7dyaTH5Bhg1jAe84EVFIxctrLoyyUMW62lA5hbdJpYS4slHON
	 huX6AnUxZdhwwLpTjLUdDkbVnGZPRUHi4VGL3yKGplQrrte+98AHJ+iCiP/92s9vEa92z
	 CBPRBQo1xNXgBg+TlQf4T/ig2PIPQM27MR5sPtsZx61hlu+/7rOJRhlM/ia9UmmtziGSA
	 LcoerZMPA5L4AI94XdGTBCoJwHNNSjEBlqOzbFIQgSNQ5RT+hxPCmWSnqzH8vcefGZWij
	 4lzCPLizZ3amKMHDUOMqveuH7mChyNWBYe4ibGT+qtkx15ztJRiuJE39L8njrmbJCvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RT0gOT2r;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ObNigFBh;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2843E606A329
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2843E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RT0gOT2r;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ObNigFBh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795709408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wxm0q+9pqrQa87GpYE9M2lUimiUIeR4Fl+shQ/7gsqI=;
	b=RT0gOT2rR8xCkwglg9rybl3uthjSotPRi3xd7HGvrwNYTWrLyr+1UNJQnlD5lpOx67yrRL
	PDxUKeGdc6iX/uWr2p/+AwkmqWEoLRphV5Ep+WI4/nRqKMeMgsXoAbYepiKErKpvD/KFIF
	xG/G9K6IP/gwKLkmE5gTaFYTUDa1t9k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-JNmUdmo4MI-A5y_mrKlTeA-1; Thu, 26 Nov 2026 16:10:05 +0000
X-MC-Unique: JNmUdmo4MI-A5y_mrKlTeA-1
X-Mimecast-MFC-AGG-ID: JNmUdmo4MI-A5y_mrKlTeA_1795709404
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so59760025e9.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795709404; x=1796314204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wxm0q+9pqrQa87GpYE9M2lUimiUIeR4Fl+shQ/7gsqI=;
        b=ObNigFBhOx+JLbP6N3ncQjfnJzrL0TpzPV6FKj3GydJWyT6u2kx8aFKE7UQHrJJ7ws
         RsjH9pc5WW9+UxEckClkKvS3h5hoINrCpIuchDZGlHHydPlI2npU2H+uz01vLy0SX0Va
         x5kMuVsk0dHYDLGkQUCUOOyEoUfx0oMaF3YIuFW5Zx4LRj+9ylWCkqSnb///3OdrWllg
         M7Wr6XXtQVbwJnnRN2wamIoBsDK3hS8BuKPSGW3Q+wkaPC+ejbYdXNY+7dM4QHX4p/QK
         c5MuSd096oMeobFfm4TQ8CBBBFBblyJMhYmFpxaaO4DycOb3euoa1uP97nvD4+gvVYeL
         sChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709404; x=1796314204;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wxm0q+9pqrQa87GpYE9M2lUimiUIeR4Fl+shQ/7gsqI=;
        b=tRjU5znPNedwpA9BCoFtVdyRjVzhteMnhwXED4o8by7dyR+Syu5B/ehpMxI1InoaYk
         R6g91tKbYcDErYiz5t29I/j7FiucyyKOtlviX7WK99n+GK5a7xGyg/GOc9uM+cYPFlHt
         tPLsh+juldpvl4/6K0f/e8REZOL/XdGHvGXmIyktcRaRQhypQJbQlFKgNQ+D7ESqrgwD
         xkpJ+r7X8WH2wc6AKt9ocqomqEYAIL785ISNwRq11N9bXjt9Qu90zqWBSLnbKORcnsle
         0UwD/tFVpgrRMtP0EhqE+hl98YftzjaGtfvzCeQl7/yW2JVNOThfAuc8CWzmC069bcwL
         LDew==
X-Gm-Message-State: APuU4Z+KhiiTlW2CrqHSuBglkAw4/bz9Fnh4r2ip5yZWKuYzDA+t+pDr
	P0mNIf++XBGWEQKd4tKWUNg+lkN53h9ATv1g1vDZ+YaZIEUFnOTIfJGV5bxGR3cvpcQ6LwljMow
	II7DMjJTZgGm0ahFPSYrUzFYZqA7rHp+vy4acsc9jbySbaaStWbTHVaZfLQ==
X-Gm-Gg: AZFdTZfjsO4iz0Z67rBNHb9lfL3hHsbjSmFkMJj1f3a9HGN6kTbHEs1ef+GIxwdnL6u
	h7KtrV7vh08GppNAmgjBmqlApdIYeosZNqzKsKlFgj6MxwXkeN75vILL1t/LYIY9srME8vvXUZw
	HN8KLK+Xmd2h2CaXAr/wfM0AAkCKFKqdZ3LgyC4/x+AsNEnHx+IBcoYB2j2RhgSnJW8srr0MDil
	0Gihix6HEoHFS0jPAYFrnMakXcl/XfAxItIHLG2/fqAzWaUWagrsmA38kjFCwhDVNGANsu89R9b
	zrKswD4batiMDn/VmrVCHLEeNiSKaUifTXHk6S6/jgFU+DUjp03D/OibZZlaihQXZplTyVnQntl
	k15Ks8h1z4Pt/SD7biKRAshC5pYpcsiQZ6JOqj4gk3R6mkaWFo4Iof1w7bAiVmubqggyVFSRXS5
	ulvYlRmHGZl6CxDqJjz3rdyWzJaPmw2cb7knE1H32DThek
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr430750335e9.2.1795709404058;
        Thu, 26 Nov 2026 08:10:04 -0800 (PST)
X-Received: by 2002:a05:600c:8210:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb887e25e8mr430749705e9.2.1795709403638;
        Thu, 26 Nov 2026 08:10:03 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm622216265e9.5.2026.11.26.08.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:10:03 -0800 (PST)
Message-ID: <bcbb57bd-6447-4faa-a56c-9bdf1c7bc90a@redhat.com>
Date: Thu, 26 Nov 2026 17:10:01 +0100
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
Subject: Re: [PATCH net 4/4] net: skbuff: limit folio refcount when splicing
 from sockets
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Kiryl Shutsemau <kas@kernel.org>,
 Song Liu <songliubraving@fb.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Rik van Riel <riel@surriel.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Pedro Falcato <pfalcato@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 stable@vger.kernel.org
References: <20261118-skb_refcount_overflow-v1-0-5551b4954c3f@kernel.org>
 <20261118-skb_refcount_overflow-v1-4-5551b4954c3f@kernel.org>
 <14059088-7992-4d89-ac6c-1e6d1f61b3c8@redhat.com>
 <832f42a7-1d44-4138-a7f5-7cead4a28e57@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <832f42a7-1d44-4138-a7f5-7cead4a28e57@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 15:44, David Hildenbrand (Arm) wrote:
> On 11/26/26 15:18, Paolo Abeni wrote:
>> which is arguably ugly but IMHO no more than the tristate
>> return value in the current version.
> 
> That doesn't work. "len" you write in the function is not tlen ...

Sorry, I rushed it too much.

> __splice_segment() passes &flen.
> 
> Further all these lengths are unsigned int, not signed :/
> 
> Also, I think we have to respect spd.nr_pages.
> 
> If we want it minimal, a separate error pointer might be the easiest way to fix it. Still
> ugly, but I tried to get it clean above and there is no way around some churn I'm afraid.

I actually prefer what you suggest here more than the current patch.
I suspect Willem may have some other option avail, but he will
not back for a few days.

/P

