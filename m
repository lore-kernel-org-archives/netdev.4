Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702718;
	b=C6AGg0DW/Nn09UE1fdNue7QxskZOEBSgUASNjgDztcce572NFDGjV8QNvZt6Jl8eBAAv
	 ksQZyxY6wVHY6TPDZ8ErIRQwMqBa+zTVPp8DRF6cO/DG9F4N53juRJ0YrK4uwbTidmVQp
	 5pXahi+lBE1npTFagMo72+UArHogL8kefZqQg39t7njFwydEb8mp/+k7AMsTwA8X7VrN3
	 o9k2Mn+dPjXzd2useIJD21BF6hjAUlClwqbELRFB4P25aKTn9gP7F+qr6zFxJX/FcKrn0
	 Dcpb4gKec1n9xC6ovmnN7B70SQCKxoZ3esOGB+72TVfiLPpR3uutazTkrqUDmsh5YuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702718;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oc0e78R7GnTku6S9kDpVJbJPkJaWrIi7MbRLcQ86nNY=;
	b=Rygh6c49eu+C/TI0CxcsigXFGM1dbn+JPQcHotireIcfZQBYmPBewP3ktj8+i3fk2iPa
	 o9hmbDVUSvCJLn2RpRr6w3MqGJbO/axLlvPRxslop61q7E4owO1QjKZJ5K7McCCbK5/Wg
	 3RbE2t9ds8xSYemOdker5iq8JkM+JYGV5Nn0tt7wex73swzA2gTi4ihJCepI0lmJ6Gko0
	 jjgpWfN2RsOCS8vuI8zafnclEvdkdp0CeMWVpImrbZtlfIsI218FITGimVfSAl2aorcRf
	 IHCwoR2Jsrd8f79zkuvyChCGQJ1YGp95PKDAoaBCD2htJ7uQtX4n26Z4Ac4VKW2cryA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GE9QxRdu;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ys9EsDdr;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBBB606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFBBB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GE9QxRdu;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Ys9EsDdr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795702716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oc0e78R7GnTku6S9kDpVJbJPkJaWrIi7MbRLcQ86nNY=;
	b=GE9QxRduVtQqzd1Ebo0bOEHb76b5LBzXOZX13YV/FJVtthCIFsfiBBFAY+GqdU2+vy02iK
	Hs0bND9gZkVA/1K2/tV5RSVYgNf/Ng50dSlke7D586O8cQlnFKn8KElM8HvmctW1IEmNWi
	yLES3/UE7gl3+FpQoMxYBjvCKO2SffY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-cWUFc_EgOMqp_r6FrEguxw-1; Thu, 26 Nov 2026 14:18:35 +0000
X-MC-Unique: cWUFc_EgOMqp_r6FrEguxw-1
X-Mimecast-MFC-AGG-ID: cWUFc_EgOMqp_r6FrEguxw_1795702714
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b9fde3044dso50603865e9.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795702714; x=1796307514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc0e78R7GnTku6S9kDpVJbJPkJaWrIi7MbRLcQ86nNY=;
        b=Ys9EsDdrD5piq4RdxKQVYvH3piYXoPWplyhnfpJP/rp7INiy9Y1Zejgy0SoGtg3E8U
         kGoPD4DrOd+KwEH1gEk1TjwU/AhH2OHPQGHemjMJxtRkV+rrn+k3+ldQLct8a2GssNwA
         NkbMJB4d7bt5+3k+FMgHuH7WF8bQmaSmJh/K3/ci9RvxSKWi5ixxyiDsdyK8pCy8e1Dt
         Xq0BRq+dHdYAoGuyqXng2A3bJ6bwlDCEjhfrVSJ5I7fnIltk/JRhHV4l1ZiRoVCruGx6
         q/28ZZxp/6pdwFDm7bTNqv/9NuQpf0DeMPXPt6qqA3Ckzam+a3BnZzkj8/1mcnpyNcNe
         Z6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702714; x=1796307514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc0e78R7GnTku6S9kDpVJbJPkJaWrIi7MbRLcQ86nNY=;
        b=fTNZ0HdsDri7hsZnGooYdUY003rT13B8JQLFvF052lgiBOVGqNYiwqCdE59MaLseRZ
         Xjn+9S4OFrlVo27hmK1oW8ZRtZLh2YacLzxC/2IJGjqQVoe+671zivEiymKqAmYYj9V3
         k1iHfzzAxIRz1aCpireFyQvI8L+M4TaX0QS2MClFF6PAYenBMixgwO4u494ve7dMkVDO
         72x9oGgDylS0BPTaDBWXbOeNXxQlzySkJbODk2kNnyJzL3FSxZfJhrx78XO50zoIYzg5
         Rlx8kjsKR5Pq4+P2jrqVE/pfIAWtinez5yvmQGTwTfoFt3vtweXbp8nw8wpBcLLNZ7si
         I/yg==
X-Gm-Message-State: APuU4Z+0oScunuBcBh3Rceajewi/iLnDaL3DMk96GtM25QNrt0csmMnC
	Y/x17HmK5/+M93wFWeYhVUcMv88ry2UIiX6RNYjdEngEPd7Ug/k7PAHoy04LDxRmo2hgnQm26HL
	AF2vsTCYGs7EdajBrh2ytO6OowH56pIGrnoDOLo1N+sCe+WY4lQQa3TaOrQ==
X-Gm-Gg: AZFdTZe/9Dv5zR9hBON3z/TiZXSqNmBv9ZqTpAoixUDxV9bkjWc9kmKZokY3pnDlyuP
	kAkzkjCMvQWXo+o2hZvlmcjgCwFoMxt5eC7sgc5HF09enA1l+iRZnpMYvwj/GqnOXbjf3BlcFil
	0AWc/fJPmrWiNsackq/KwFqTq82gAzYjsYdOQ7h5FUnnnCGWruMrzY8YpmprBSVI29gntMe2nNI
	HhjZJmlK/6XSY+sJYhOS9+TOanP4yXtGCcqWB2DrAv35D8gmNUa7CNFZc6jg5IPGW8H+qpbpAFE
	3LrazhAYJLokCxLCEc+clOk2E0eYgWxoiCwWXMDgrS5Kyj6ev9SXsXIodyjEcC3n+V0Vk9W3Ktz
	Uj+CfcUYUuEDlWfMQhb9CidnF/bzdAz7Vte6RcPtuRzef2CKgazU08+6pSuZZzmMhwO5gDl08ER
	LGdBPte3o0gfoRkG2md1dUPrlC4hD4plJQgwOZhlFJ517R
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr430554135e9.10.1795702714053;
        Thu, 26 Nov 2026 06:18:34 -0800 (PST)
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr430553595e9.10.1795702713623;
        Thu, 26 Nov 2026 06:18:33 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm1120826425e9.4.2026.11.26.06.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:18:33 -0800 (PST)
Message-ID: <14059088-7992-4d89-ac6c-1e6d1f61b3c8@redhat.com>
Date: Thu, 26 Nov 2026 15:18:31 +0100
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
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261118-skb_refcount_overflow-v1-4-5551b4954c3f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 09:32, David Hildenbrand (Arm) wrote:
> @@ -3299,14 +3311,14 @@ int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
>   		.ops = &default_pipe_buf_ops,
>   		.spd_release = sock_spd_release,
>   	};
> -	int ret = 0;
> +	int ret;
>   
> -	__skb_splice_bits(skb, pipe, &offset, &tlen, &spd, sk);
> +	ret = __skb_splice_bits(skb, pipe, &offset, &tlen, &spd, sk);
>   
>   	if (spd.nr_pages)
> -		ret = splice_to_pipe(pipe, &spd);
> -
> -	return ret;
> +		return splice_to_pipe(pipe, &spd);
> +	/* Returning 0 would make callers report EOF. */
> +	return ret < 0 ? ret : 0;

AFAICS the above introduces a change of behavior:
caller with tlen==0 get 1 as return value, while they
used to get EOF. I think the return code from
`__skb_splice_bits` should be ignored, when not negative.

I think the churn here could be reduced re-using the `len`
ptr argument to store the error code; something alike the
(completely untested) following:

---
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 85d5caa08887..9fd5116f33f3 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3177,6 +3177,10 @@ static bool spd_fill_page(struct splice_pipe_desc *spd, struct page *page,
                 spd->partial[spd->nr_pages - 1].len += *len;
                 return false;
         }
+       if (!try_get_page(page)) {
+               *len = -EFAULT;
+               return true;
+       }
         get_page(page);
         spd->pages[spd->nr_pages] = page;
         spd->partial[spd->nr_pages].len = *len;
@@ -3299,6 +3303,8 @@ int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
         int ret = 0;

         __skb_splice_bits(skb, pipe, &offset, &tlen, &spd, sk);
+       if (tlen < 0)
+               return tlen;

         if (spd.nr_pages)
                 ret = splice_to_pipe(pipe, &spd);
---

which is arguably ugly but IMHO no more than the tristate
return value in the current version.

Possibly some comment around __skb_splice_bits and/or
spd_fill_page() would make this option more palatable.

/P

