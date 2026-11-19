Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049332;
	b=KZbyfD673GXGKOkAGdJNtg/5NfipdcBxhBG4vIFe/eJdZTPi6P3Lqqt8QHfCxl9Gqwoi
	 Gwjlndw9j9Xto4Hjg7H7u5Q1xSOGfjfLQK6Sa9Ljfi2RPmamPTd7ZeZGFNX/+BdmiIYSS
	 IF6e/ZJI1SUvNOKYNFLskxQmsLRsTTaKo/1IgUiYp1WMnivS4s0clCz+hJmW0bzLAiu6c
	 gsgi9bjwgXySW0yNnafe+PKGW98uvRHC84qOUoDhCxRz1wkAb3VJOAGi3IBQlxnGGM7fm
	 oirSULfA8H9wHCr45D3ruWwxq3RTM8wYPbjz6G/uem82Zy3sL6W1ilUx+MJ338vAPmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049332;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=4UH4MuHKqQSdHfWzmTuo+LVB7QPfsbG6UhR9RvJMQ7U=;
	b=yK78b7E3t8mpwkq/aFirSZ5V3wBCaOHCJ9yvr8TmzESH9eXnpnyeCqYbykYmLhd1AMTK
	 uQ6C40/IHwkUgoj37DN/jO5VAldOp4Mf0eDn60yGeXx+cSQZXjxgkoqV2ZoiHV5i2BmP/
	 nQAeYGsEVR+pKu8sPgW35Tde3w59nqPgxV/+3EClZpoQT+ow0IJsgvcNZ13vY2QuX4Cwm
	 EkKjxYEhY2wvggRFxIXNKwLPNktnfNLO9yazmxJb5OzZtfrmvcJk9j5gXBUPzFhQkZ2TE
	 wmzes0UNZJy6cft3qGw42wNLDYt/YLnlqPTjkOqS9b0XrTna/ng5CBetp83KZ7d89dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=azeLv1LH;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gOcSuuYb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FE960A2605
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3FE960A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=azeLv1LH;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=gOcSuuYb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795049330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4UH4MuHKqQSdHfWzmTuo+LVB7QPfsbG6UhR9RvJMQ7U=;
	b=azeLv1LHK/iqXc4WUpTIlbv5KrbzmBJmmPRJ/8sx03q5QvXgADEwe2B+gZ85ntTALOkDd7
	VuWOBjuFF6ip0NEhGWEG0cWawYYOiF5LOE+PF9oSl4BZNUxUzXMoiCYUK3MjTkcXL1VYRF
	0cSiiSZXDhfnGqgJ2nJpKu60D4rV6oo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-TSQffc6eNTiR0o1Ju6oVvw-1; Wed, 18 Nov 2026 19:48:48 -0500
X-MC-Unique: TSQffc6eNTiR0o1Ju6oVvw-1
X-Mimecast-MFC-AGG-ID: TSQffc6eNTiR0o1Ju6oVvw_1795049327
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb64c99bb8so15682415e9.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795049327; x=1795654127; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4UH4MuHKqQSdHfWzmTuo+LVB7QPfsbG6UhR9RvJMQ7U=;
        b=gOcSuuYbWRF+WCIPDw53q1IwgfBu1II6cdW9d0LYp5XnthmvC/wH4/1K+tNFDTGYQt
         BKxNKJ+XokiVmNp9nr4uNkZr/LXm8mIwqOmuTuFUIMJ2t69P8pDkZfYTb5b6RdMY8YXf
         JC/uaywl84FaS/EqHmkk4HYyWoiQp7zMmNNC4bgpdW4F5kqdyXcVUVBIeP/FKjm7jNSz
         BDhs+NI8YzcbAfXNzUHoIlkC9E63dr5N93/P7Ur9w8qeIz4xam0tkPkHOSwMsAOiuIk6
         PCv2Rloo2sL1yTpIKrNTzYbk6PbJdwAVN1o81qzB7LKy2P/4e05tSN36ZkYoK1WyLfHv
         M7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795049327; x=1795654127;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4UH4MuHKqQSdHfWzmTuo+LVB7QPfsbG6UhR9RvJMQ7U=;
        b=OTqTf7JnTVJg8z+Fdd85+Lgx7iT7cNf1y+0CqZRb2H2opuOEc+Tj28zv2pefgFVGO0
         ywGZSIAcch3k+mVukIVbUS8AVbIyZXH1jzw7G9WEz/WvvI5UKmFXAiVkeqAsjXvzpeqR
         8bElnsHQ55HHHxiu70tSxncK/M+ZgE4uFtUxPOR4GfuAtWliu2YJ4lNNibK9PiErwSAQ
         3lzoOMSGMFvvkKsdSFZe12wzoeA4TNquvK5eTbzpS4dULbVM6Y3473cn1fZC4GKMkD/q
         9rqHppI3+Fv1timqkgTCjLHp42kxPC353xbfmiSPnThHv1gntO2yF6b98EikWvYfHa2k
         6qIA==
X-Forwarded-Encrypted: i=1; AL+hErE8r8Z/s3JSWhPTe4T1WXHLxm9Fa6B7iPMMifiGu0a2YjKC2VKNhIKNK0O9qhbumKoPxvamNNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2T8oqBmuWbzdPP40+oCq8Ye4JLQjIZZFa9s3irUzCCXYrUB8w
	poiLSaAP7fajgZXtGAzeXj8w+KwyJ6ogDjfZdbtid/bpy0TSDHijyhldHhIOkVEMgB57guM5NRZ
	cleYB/Uxw8gfStzoDRSlHO8VbzqzGAE6UtHU2y8V2bn6JYLJN2WtOCwbpGw==
X-Gm-Gg: AYBFou3XWSELpY9rLXlvQ15ohosvMsQe2Lgo7m/NgxETppvaGEV1sXT2FvkN8DVAVY1
	g/8vzq8oZwxTCWRxJtHFuszJfJHsxrBHienXKlc6Hm2lFbuv1I37JT2Kj94RYLGBpzDQv4QxhQb
	g/onWiHwy1r/leVMlxc/K+FeEnVTaO0nnQ98l5Lazgsyhr2Z4EnDVCqeogbfpMuK0DTvBDW2Drp
	fddLjEvqeQZk0svwszKsdHGGsVavHn8NNoAm6EHMHXVa24k8HluGKNhdRrdxWborigGowpuwN0i
	ZYd+CDMEp0iAqH0RY+r4buNSZXVD58oxRwLrX4SiZgW5G0iZVB071FOX6809bE2/PmhZ0NSxdZY
	iWk6KtYDO/hu7s8E2YGTjaKnU8F6FERBkdQh6XzqvR7Q8WfYU1cksJvABa4I/gkH6Wd2R2OWmcq
	VCo/4=
X-Received: by 2002:a05:600c:4e93:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb7da138f5mr88386225e9.5.1795049327533;
        Wed, 18 Nov 2026 16:48:47 -0800 (PST)
X-Received: by 2002:a05:600c:4e93:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4bb7da138f5mr88385915e9.5.1795049327215;
        Wed, 18 Nov 2026 16:48:47 -0800 (PST)
Received: from aconole-thinkpadt14gen4.rmtusnh.csb ([216.212.39.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8450fa2csm10785465e9.7.2026.11.18.16.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:48:46 -0800 (PST)
From: Aaron Conole <aconole@redhat.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,  Jakub Kicinski
 <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Simon Horman
 <horms@kernel.org>,  David Ahern <dsahern@kernel.org>,  Ido Schimmel
 <idosch@nvidia.com>,  Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
  Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,  Xin Long
 <lucien.xin@gmail.com>,  Eelco Chaudron <echaudro@redhat.com>,  Ilya
 Maximets <i.maximets@ovn.org>,  Daniel Borkmann <daniel@iogearbox.net>,
  Justin Iurman <justin.iurman@gmail.com>,  Linus =?utf-8?Q?L=C3=BCssing?=
 <linus.luessing@c0d3.blue>,  Sabrina Dubroca <sd@queasysnail.net>,
  Stefano Brivio <sbrivio@redhat.com>,  Hyunwoo Kim <imv4bel@gmail.com>,
  netdev@vger.kernel.org,  linux-sctp@vger.kernel.org,
  dev@openvswitch.org,  stable@vger.kernel.org
Subject: Re: [PATCH net 3/5] net: openvswitch: use
 skb_set_transport_header_careful() in parse_ipv6hdr()
In-Reply-To: <20261113124625.4010206-4-edumazet@kernel.org> (Eric Dumazet's
	message of "Fri, 13 Nov 2026 13:46:23 +0100")
References: <20261113124625.4010206-1-edumazet@kernel.org>
	<20261113124625.4010206-4-edumazet@kernel.org>
Date: Wed, 18 Nov 2026 19:48:42 -0500
Message-ID: <f7th5hdk5n9.fsf@aconole-thinkpadt14gen4.rmtusnh.csb>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Eric Dumazet <edumazet@kernel.org> writes:

> skb->transport_header is a 16-bit offset from skb->head, and U16_MAX is
> reserved as the "not set" value. skb_set_transport_header() silently
> truncates an offset that does not fit.
>
> parse_ipv6hdr() stores the payload offset found by ipv6_find_hdr(),
> which depends on the extension headers found in the packet. Should the
> value be truncated, key_extract_l3l4() would parse the L4 header at the
> wrong place.
>
> Since commit 3744b0964d52 ("ipv6: Implement limits on extension header
> parsing") a single chain is bounded to IP6_MAX_EXT_HDRS_CNT headers
> (24576 bytes), so this needs a large skb->data - skb->head on top of it,
> for instance after several nested decapsulations, each of them possibly
> pulling its own extension header chain. No reproducer was written,
> this is hardening.
>
> Use skb_set_transport_header_careful() and return -EPROTO if the offset
> can not be stored. As for other ipv6_find_hdr() failures, the caller
> then sets the transport header to the network header and does not
> parse L4. While at it, use payload_ofs directly, since
> nh_ofs + nh_len == payload_ofs.
>
> Fixes: 1a37e412a022 ("net: Use 16bits for *_headers fields of struct skbuff")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

