Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191673;
	b=O5jjTQ4/csaJRkB9Nxt2pKquIh7yKB1GXG4Vp7zW0rD99UfPyxrGwPa+aq/G1wCn1q2w
	 kVWIyRG1l4t1b+qgmlk7dYKB1bJhP88WMog4kWhSALWxbLuJE28J6fjZImIJhI2bgSJQM
	 qGxp/tfwT4tVmW4cHsQj9MJYYQTe3KxrzgLO7NMOAXnFo/2Lf06EaXkODTrZ74QeP/ari
	 0gKMrag87RCZF9qqhBPORwKXvavlFLGOQmacpJx78u55qgsHdu/ewMjkDKfzNWWw0b4bB
	 Xn7MkxODHVzK4oIW+pIcJgG/uVT/2UuiBj+xU1xRb7JvA4ZgklKsvr7UKq+G8jR7/4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DlHp18CPjbRy2dBjwYmV0o13g/8Est+vNGExs52wGVI=;
	b=0+7OHeXvzubAaShYFEM0kMu07JHKK7dnfeIrhNVDTK/xu/719Rg+JqqC3ltEMCQJY6YL
	 ZLOxIb67XndtJivAitWQxHcRdhQkdtmoUbGhwSuLE48ngY+4bSLXQ77u9zXk0TYv9ecRS
	 /BblGvF4B4/HHwg0Msxl60IscHMH5i0x0fsQpPsRAW6jLN3TLhrwBfJP93mw8ItLry0GD
	 YGZNQhFfibnhHkGiI9NGlO9A9fBTwgM//tk0FLvnksfbg1wltFGqI+tZloEL9L7hgjGlL
	 zsWKFPX2bvteIkUOgj2O6Tz854KyppAAyg9/9YRNUf7de7e3eKUuysn18uXcMK7sBow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFIMvXBw;
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D319606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D319606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFIMvXBw
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cd6b195dd0cso87114a12.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795191672; x=1795796472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DlHp18CPjbRy2dBjwYmV0o13g/8Est+vNGExs52wGVI=;
        b=QFIMvXBwT5UZma+RH3dkZsdOYQvdRV5lMg2aPbcMemqkf8Dupdo41EKmwIjAfGV4QA
         Rp/STC14Fr5kxpZn+8zkLj31m1bjMjxlpVWu5+0//Z8eCJbmEBx3iIRpFCCMESlrrf9Q
         74BR4tGYR7QwgQcBkHvI2flO0QSGZaaSskVdakj/+23kYau/j0GxnIcVBm3nNd5igetR
         HGiHwoG0tUTt/5hlWBXpo2Q8eAbrCY5t5yCGNINLQ0L+yQv+Ww8SSN4ZSQZtyT1IqnWr
         gdzRJT0GAx4L7UAT6H4ozbogf5xYExqjbow2iVzPZ+99dtMfu3s32l3yKwAv/yQqsHNG
         Cuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191672; x=1795796472;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DlHp18CPjbRy2dBjwYmV0o13g/8Est+vNGExs52wGVI=;
        b=yJ12oFEiX2GwHiUMO5NIDLQTCIfF9DZ9JlPl6gNGJwjuhqjynFH9QPzvH2vXArAaWe
         jDctWVWMxJNldBOkNiVPVrQbzZz/dJ0l3bfIHOQ4ihhDNgAkrVAYp69HypFlUUdrU8w7
         sDdJ76EJfcTMtmEC2vDutTscE+baLjOg6XLe+gPyu8gaHqxqq48oScq1xSunwtbRrbFR
         rp3sFYpsDShjXw5ZB67OSOfPcFYIX/SWxZZG3ArBmA6IOCrpnm+oaMBygymkdK94crKs
         tbzSzHUcMCCFw8W6ke/oJx9Y3RrU1hCzaiBPPhTplroK6APFuT0hOHbhEE+1ds3x0Lg7
         s0PQ==
X-Forwarded-Encrypted: i=1; AL+hErHCDIJElP0+aSi67HEkqFERNvfsvxJQ+MUBBUoLCrwFUiwV5tJKY56jV19FUjoIk0kLndztg4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dMlwayjUH3T92Nfo1lohOk8Gv9DFwGAJ9k+mzJf1mG/3hWDOI
	I/hVJlgzE7UgfwNDtQ5atjdsVThgjKPTww0b/AmewUCfCXpiBNUF0Tf+
X-Gm-Gg: AZFdTZc09NJ4fanevD7ZuJnBZRGCxmz1y9YnIccc8hRCHeOhhY/LXB7GJP0plQem6Bc
	ZAPHOZV4PugBAcmKRH08j7Lbcrjo/yMAO7PEkuzLVKPB3FoeLVZoWTP/n7RAMSQx/H5b4z9OSxe
	+5g/DiliwZZF8Flq+tmb2/9KAvTnvlpu+FGwXlvj1CQQ1ZVg8D25YjmZkIxfTzVpO8ssaDKt0fN
	q0TYjTimXeK194thsU5yxP0jWeOWiEeJjAHxb4AAtavX1HCmtgXP3Fm0RNEhDJnw+MNkmA23gEZ
	1aJrvMB4dffpK03b4R1/bySTx9y1LDwMc4GcPm94nCOOeU3BlEKNkNulWH0w7scTUBT83Ac+JIk
	PZyqxdxSQ4FLvKubU0XKnOrp50zFLQiguXBy4bSHbrrrOQRvYkLsx4Oepjx3649aoHM6F+/kmMx
	aZiQuK35eBeBPRVbrQCaQtlMipESVLieD1XxkrSoXABw1U4wRZrKePGG31tqeGp3HORXvLZjr/8
	uclCb5g7nSkQhl5/5+yX3CURdL95LWJuO3aEWkhvqEJdoDW+hK5bTxRXPHkla61GxwmR6y32MT+
	XhZsHP8YCQLCavl0XArC2IM=
X-Received: by 2002:a05:6a00:1c97:b0:8b5:7fc8:866f with SMTP id d2e1a72fcca58-8c87d32b004mr3231608b3a.44.1795191671804;
        Fri, 20 Nov 2026 08:21:11 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45e32sm1696071b3a.24.2026.11.20.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:21:11 -0800 (PST)
Date: Fri, 20 Nov 2026 08:21:05 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Kiryl Shutsemau <kas@kernel.org>, 
	Song Liu <songliubraving@fb.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Rik van Riel <riel@surriel.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH net 1/4] net: skbuff: limit folio refcount when copying
 skb frag references
Message-ID: <awBy7PoxdEMEGWyW@devvm16445.scu0.facebook.com>
References: <20261118-skb_refcount_overflow-v1-0-5551b4954c3f@kernel.org>
 <20261118-skb_refcount_overflow-v1-1-5551b4954c3f@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-skb_refcount_overflow-v1-1-5551b4954c3f@kernel.org>

On 11/18, David Hildenbrand (Arm) wrote:
> Various networking features copy frag references of an skb, for example
> when unsharing a cloned skb (AF_PACKET trimming a clone), when copying an
> skb (nft dup) or when building NFQUEUE messages. This is an effective
> way for multiplying folio references held by an skb, allowing for
> exceeding folio refcount limits.
> 
> This is not specific to large pagecache folios, but with them it is a
> lot easier to reach the refcount limit, as page table mappings can cheaply
> create many references.
> 
> Let's introduce skb_frag_try_ref() and skb_frags_try_ref(), which use
> try_get_page(), and use them in pskb_expand_head(), __pskb_copy_fclone(),
> skb_zerocopy() and pskb_carve_inside_*(). All of these can already fail,
> and their callers handle that.
> 
> Fixes: 800d8c63b2e9 ("shmem: add huge pages support")
> Fixes: 99cb0dbd47a1 ("mm,thp: add read-only THP support for (non-shmem) FS")
> Fixes: 793917d997df ("mm/readahead: Add large folio readahead")
> Cc: stable@vger.kernel.org
> Acked-by: Pedro Falcato <pfalcato@suse.de>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  include/linux/skbuff_ref.h | 53 ++++++++++++++++++++++++++++++++++++++++++++++
>  net/core/skbuff.c          | 35 +++++++++++++++++++-----------
>  2 files changed, 76 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/skbuff_ref.h b/include/linux/skbuff_ref.h
> index b6f6da556ee90..560ddc863bbec 100644
> --- a/include/linux/skbuff_ref.h
> +++ b/include/linux/skbuff_ref.h
> @@ -44,6 +44,33 @@ static __always_inline void skb_frag_ref(struct sk_buff *skb, int f)
>  		       skb->pp_recycle);
>  }
>  
> +/**
> + * skb_frag_try_ref - try to acquire a reference on a paged fragment of an skb
> + * @skb: the buffer
> + * @f: the fragment offset
> + *
> + * Like skb_frag_ref(), but acquires non-page_pool page references using
> + * try_get_page(), refusing additional references to a page whose refcount is
> + * at its limit.
> + *
> + * Return: True if a reference was acquired, otherwise false.
> + */
> +static __always_inline __must_check bool skb_frag_try_ref(struct sk_buff *skb,
> +							  int f)
> +{
> +	netmem_ref netmem = skb_frag_netmem(&skb_shinfo(skb)->frags[f]);
> +
> +#ifdef CONFIG_PAGE_POOL
> +	if (skb->pp_recycle && napi_pp_get_page(netmem))
> +		return true;
> +#endif
> +	if (netmem_is_net_iov(netmem)) {
> +		net_iov_inc_ref(netmem_to_net_iov(netmem));
> +		return true;
> +	}
> +	return try_get_page(netmem_to_page(netmem));
> +}

I don't see you removing original skb_frag_ref implementations after
the conversion, any specific reason? Do we still have any skb_frag_ref
callers left? Maybe at least you can make skb_frag_ref do 'return
(void)skb_frag_try_ref' to avoid duplicate code?

(optional) Also, an easier way to migrate might be to make the existing
skb_frag_ref return bool, convert everything, and then add __must_check.
