Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795694774;
	b=3fnKRzPveMrl66vc0Jeps7e96OEylkzx/Ln43tdE6UQcjyScEjeDd3R6C5ZURyRw2wH9
	 y19JMfjJPW6hm3tFDV+21P/jR42MN/eLg6380MPoBbW1Y0k3LZE3N6LPNkJ1XP+QpIkWM
	 TZRjm7FeogYnRjvpoWwnmpc/8mHYqNjLRFpbwKtW6LV06OaEEGZFyfl6xBQvsrR54oBCy
	 BAUv//j5garqAS51B+Qh/HfbjuAa0qBl4g0MU2SbLfqgYh2diE/ztn3De1M0A+ETpzheQ
	 4LRuNkhyqdy0At/02f+IDSb48pxzIqEih7OV/4prtg7MoeLAGiG73z4xpMl+TrxuTnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795694774;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aGCxCoeZe65dB5lUqjeJJVfPXWY7DaXikZwD3RqKibo=;
	b=Itfpk6rH/fxNBTLG1yj2HCmGxkdPzwBv0s9Ox+8jpgG/yWdboQlzndWZx+vVaOO7LApn
	 WWBfEyBdQYaWaOUYbAU13swtCKonTyMYMIfQo69MUfUzB7cOA6eci3vqhD9nG2vlaGv40
	 Rac+OWO/BXIBcDsRxFzHYyn5UNWT2v7p8dvFidSTAYXiHRDAB7CCGB5u+rVXyhlF448Sd
	 W4OXn0T1VyPEbqhmJ2KKdIeKNv+lJVOiPVZ31Oy3B37j83PF74XlnBf0IE9iz0kb7rLKk
	 JvAk5INDxBe424xre/y7xKfS1PPCT3rQ7E3FSXUKR7XHnQL8iMdNL8ja/g2ibPqSpNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ym7SwNoB;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="I/RvHwGy";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635D606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6635D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ym7SwNoB;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I/RvHwGy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795694773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGCxCoeZe65dB5lUqjeJJVfPXWY7DaXikZwD3RqKibo=;
	b=Ym7SwNoBAMpU4sYpZXpmCkcpdrjDepP9/KGm1mszzGfPDr/O0qB0XPxp4JH7XNuxjT3vic
	VDfAmK2HlSaDk8VGaaBKCPj2n6wgC5xguF3cnlbcUaDYwxoU1wqzoIvt0EQAihiXbuar41
	HQAvkrJTMHtcCXTpbRYI1pbeQsnS2HA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-MIf7I46IOIeywmVhxBYc9w-1; Thu, 26 Nov 2026 12:06:11 +0000
X-MC-Unique: MIf7I46IOIeywmVhxBYc9w-1
X-Mimecast-MFC-AGG-ID: MIf7I46IOIeywmVhxBYc9w_1795694770
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb64c99bb8so56915555e9.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795694770; x=1796299570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGCxCoeZe65dB5lUqjeJJVfPXWY7DaXikZwD3RqKibo=;
        b=I/RvHwGy5c3yowHB+raES4ruWoUUYv9yp24rrXXmjUkJJ/z4hyZnWJqs8G7aPeo9Ga
         ePyLxPCq22iEqG6drzrlxIof7uSKwVF2yOnEGSF8wJszop6esvUq6h2tGHnj7J/Tfitc
         8nzPX+kjuNewFfCZNvreZirjbQYepvqhi8TLvTqVc6eBXswf5JvsftO2hvIpTsCc8sWD
         UwgAE+8y5wCHWS1fiwJXEPf3Tmg99Gw/beChc1duSC2WszZ5kHCL2+PyDNsJrj4wfaXT
         udRQbjjZfDSbaf2u849Dpt0GgL8hB44xJZzYfCHCt90VCBDMEJfsAwtDzxVzBTxdjuS/
         ubVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694770; x=1796299570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGCxCoeZe65dB5lUqjeJJVfPXWY7DaXikZwD3RqKibo=;
        b=wqXi7fMM9oo2ZsvLCESzJKrBrOipYSvILDGu2fppGMaQxJQTdElOE4IevJ22fYkWaS
         FP70kagEoTGQillKySgMcSiStU0MYSetvn9VEoOhAQ2GEiBp+SFr5BHHAJWwGvwhtebP
         Reey6zFm0zF29CjnTQqOUhUX744ZGPOOC51wa9dL3Pr091ExPD+wV1styYI2IRbEYio8
         6UbSJ4T72Oez90U3ikLfo5lyoASMrce5bTUUmroO9H8PzMte9Hj/03yCJC0/Y7PJSSAO
         HCCYJrRSkqmkjuJVvILcm2YAgE4d07tiNwyjm4j+Siw+KRJBMey5TXN2Q47OxU5WiS6a
         wJRQ==
X-Forwarded-Encrypted: i=1; AL+hErFpx16YXYHZuA6Zjh3pXCcsaXwsZ8ltGYXoJK8lVbdanNh3GioxiKkJQAIVQyFeZEE96ltdVcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S5lVzNWGqnuJp9puDyjUZaJFVE9/HrRQRYN6NSlsak8YFjKlE
	i4z1fkyb8QIJCGTv8CkQAZO7X1dAgSU5iTYA67xx+8RfnhaYKWZCcmpCIuusF9mfr6zX+hKkOyK
	c1ome0ebd2Z1zRkAvyC7NSdjY6963RNtwqX9626ruUYGuDUbmldpzHUfU22Qr+O6bKg==
X-Gm-Gg: AZFdTZdpBNtLkNCoA7vGmd3QQYMqr6Z8Stl+QhF10bSU537Vok+jOOQmTwJPa5frzSm
	FYAPiJnynTUyqTlSCw7/Z7TBYRDgO18w2L5n9wWlwedFnn9kBbyinTH8MXi4VFZaFyG83I2bjz7
	4VNTKczPE/qTqlwnM11gpC+NZaLf3T0I4QM7SloJSaOKQscetpCSEFl9k2WjqPj1mwxX2JcKs91
	266JrPwl3g/wUuuDDEZf2rH3fvn1jKqHc4pOUkIhetThLZCl+JJOzTxj0F5hP/pcwz7cHokXlAu
	Z4x5Td1zeNYTwna91G8G6Od8I+vTsC6SZGdSxTCyK6qWO2iPTfFlvxaLDRpejykgCA4zBo+mN/z
	nmh0Ff4NM3UdBmRICLPBoxhfmErIouTZU6Ii/N5UjlHWmLEzd2UdDgfKJUYJkkguuAXNfaqOlxm
	dGXfAdO0p47jXQfRha+ZtVwP3smgVDDG82BhHPb6fNuEma
X-Received: by 2002:a05:600c:a087:b0:4bb:60bd:53b2 with SMTP id 5b1f17b1804b1-4bb887fe7bdmr427507195e9.6.1795694769857;
        Thu, 26 Nov 2026 04:06:09 -0800 (PST)
X-Received: by 2002:a05:600c:a087:b0:4bb:60bd:53b2 with SMTP id 5b1f17b1804b1-4bb887fe7bdmr427506665e9.6.1795694769425;
        Thu, 26 Nov 2026 04:06:09 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm405303285e9.4.2026.11.26.04.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 04:06:08 -0800 (PST)
Message-ID: <dddc8e30-73fa-4ac4-8467-ec39184a3fc6@redhat.com>
Date: Thu, 26 Nov 2026 13:06:07 +0100
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
Subject: Re: [PATCH net v6 1/2] vxlan: reset the remote's dst cache when
 snooping moves a MAC
To: Zhefu Peng <ilskdw@gmail.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, horms@kernel.org, kuniyu@google.com,
 mschiffer@universe-factory.net, nicolas.dichtel@6wind.com, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261119095256.42005-1-ilskdw@gmail.com>
 <20261119095256.42005-2-ilskdw@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119095256.42005-2-ilskdw@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 10:52, Zhefu Peng wrote:
> +static enum skb_drop_reason vxlan_snoop_move(struct net_device *dev,
> +					     struct vxlan_fdb *f,
> +					     const u8 *src_mac,
> +					     union vxlan_addr *src_ip,
> +					     u32 ifindex)
> +{
> +	struct vxlan_dev *vxlan = netdev_priv(dev);
> +	struct vxlan_rdst *rdst;
> +
> +	lockdep_assert_held(&vxlan->hash_lock);

Since this function has a single caller invoked after acquiring the lock
the above assertion is quite redundant, please drop it.

> +
> +	/* The entry may have changed before the lock was taken */
> +	if (hlist_unhashed(&f->fdb_node))
> +		return SKB_NOT_DROPPED_YET;
> +
> +	if (rcu_access_pointer(f->nh) ||
> +	    (f->state & (NUD_PERMANENT | NUD_NOARP)))
> +		return SKB_DROP_REASON_VXLAN_ENTRY_EXISTS;
> +
> +	rdst = first_remote_rcu(f);
> +	if (vxlan_snoop_same_remote(rdst, src_ip, ifindex))
> +		return SKB_NOT_DROPPED_YET;

You factored out a shared helper, but the other checks
looks duplicate as well. Please de-duplicate all of them
moving in shared helper.

/P

