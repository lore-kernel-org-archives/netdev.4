Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794687466;
	b=WDOJYpmm/niqms1NfngTdKCfmUivQtKUR+EELByJEttQJ3AkOImmaI6jcpiYoqgz+m1J
	 KEzz4cvYdZUT3c88U7mZMcd1w4YUB8hq5zonf55Ex9gevZ5aEJOxViFDPyebhegzi7cgt
	 H+UmWWa0ntIscDnyu5FnTprn63e+RYVRqSEprRtjOaD4yfNXCVTJGGiSxCpLRrtVc0sjq
	 uCICc7rKEVQaVcyvVl4X29p1tckPov9LXhxadk1MESyXaC6jfh52ixo9AAnJqRnAjtbUy
	 A96lRkz/2ugpTVEQToZEGKAXX/ytbM64uwDs8BoYv1nCeFBcthX2rAcda0yi++Pi10g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hwJZ69vicp6RFveDrtsinePrWwv3SffhCB8NelD+72Q=;
	b=lDE6uePLTAkwTXx6yjApaPzAxjs437qW0ofhoB2soZ0p4xky9VHMWYxov/7/NcZUoXc5
	 FzTXC4B9tUpL3+wT0PVPTE0W4WA7XCSs5tVDlEUnJt0XuHGjBQUP+mg5Gu6eaWpedO1OW
	 BROhlgbuWkCRV5l4BFMeR+qbFkJq+zOAfbwD1zQbbHDpcUrDu1Yp5XiEBBtAVpAmD2Ggt
	 4zXcL5po/pMb0ps/LgpDOiTDNxuIbOHpYblofnhEc80lCOiQXO/s7abFucp1lAc4I3kAl
	 Ir8PAEeSjf30WjBFzVw7CaB89ORp2T+YJ+GXFNlM8kKy2tMoTnX1O/40+am8//Z2BHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjLW68oR;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A92606A327
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:17:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A92606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjLW68oR
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2516196f8f.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 12:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687464; x=1795292264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwJZ69vicp6RFveDrtsinePrWwv3SffhCB8NelD+72Q=;
        b=DjLW68oRhwkqA0PK2vF8zsRowzuA5L08dpWNALguxW+zv+saLzwh/HANv05JZ6fHX6
         RrnnMTp2MojzsfAkB+hjsNSBcpgorGtN904+kKRCOkK4gZbOMd4Lb+Xy99txirR3q9jO
         vSG8XQsAs0VTmluD7/YLWB11snxj04TrTjANo+Tp7uwT4cMa9NH6D+JAlVJoyxCbymRh
         lujzrTSGHh2knQ69H/n1n+85Li/XmJtwC3sp8CJjemjoMc/SIdQCNC+JOyWHmDSzBoW1
         4yaSnKhP82KDSLrARC09xUooAD5YEcqPtLJ6uaeByMLDJGUkBRQfG8TpmoIjeb6t6jcw
         4jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687464; x=1795292264;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwJZ69vicp6RFveDrtsinePrWwv3SffhCB8NelD+72Q=;
        b=zjTxHooaaGQdmPBp4haS863OgNNKUzltebNDhUHyNw/j7HLU3RRIy83fAGFazR9175
         NUlzRNvMH8DM0G3Q4mfSJ3blMkhoFmehojYRksPeMh2J/GqdQJPlVy9ZYqTh24Lr8kYe
         DjFXfP++PwwNRY3+MnY/Qe509WUX9H5iFeYweb/PcB2xzHJmXcB1+QY50aJN3nt41i4M
         Nyz6mP11+6F/y1ytjTDZ9UNkVJmVXu0eXG+5Q9FQqoLFE7ACuhsjxMwsgBDrUwx2KCln
         ma210xuulwNpVyXSEd3+IoFoRPz+dQhafDBTX0HXRI8SydIKWFjdlNiskdUgosqybYdJ
         4vjA==
X-Forwarded-Encrypted: i=1; AL+hErEpISjq82vNL4kni6+XnG0u6MXL+oIw9lQFXMMIUR8qLLnVGgBUrVK7xL129G5W3rQcy81tdCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AfrdAt/r2FGdHqeoNTWVt9HXIJ/2UviGcQBDkn8l4AI1BeXRo
	h3ulWxvLRA+SF9kOzztmpbGaZcm2DYB7fzDLjIoAfY3KFNj333XwPFYU
X-Gm-Gg: AYBFou3mEhdQUVwp4fgQ77Jcehb+xOgVoXflrzkgvnqVEBB16fQQQTPwfp86lgqVMdk
	cBtxh7j4euKCGc+AmZ4YTg1jiJlo53P4ipea/yEsre2vXtyLz6Y8R3w18REiEQtrigstpnRfTHV
	uLfZZyUqWjx2PiHsXUiUWMz+eND/n/WJ0cU4kIpXDok9gukPs1eqIp3aWYnGBnoYXDugBYQgJgc
	JQrZpsNK9XgnpWtXVh+3PggzS3kYUBUbPLks+D3JhMabCvNwaKlpcNMjjt83vbDD0aZaU1tyylH
	wwKSngBkwLChItSCoiVEVXCRlK9AjjZvDaXWdUBL4Lzz9I9g5vKzQLV97X3gXqpeuSqm7hSXuQd
	Ex5Nbc1HEue01YMdeH0KhVcbpu5bYAKrZNRHmkChBS4dgvixnRQJ8okpSV/PAxc3Iwor+/hp04y
	17Zd1M3+Zql8NTrH0MB6Ew/jDpmFmFwdzAn+a7JOTg9tTwUHQiaO2eJoXtaFHq7aav2WZuzS7x6
	FX82sMkwgj/tU+0nkHpm2YP0UO+VgAaLYfvf8mRibLFakbNGEAWz6C6rAN5+fVV9ssh7L2GysSR
	glN7wzdP5FD9yC/yasH5hxjR0j/iAtTmVr/SX3IkSwFg2zcd6cqCmPmSwKGzum2HcZUrdIb4lnj
	p8szhLO4=
X-Received: by 2002:a05:6000:178e:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-49c73a0550fmr14049604f8f.56.1794687463516;
        Sat, 14 Nov 2026 12:17:43 -0800 (PST)
Received: from ?IPV6:2a02:a03f:a75e:9a00:a644:3b4b:4691:92a4? ([2a02:a03f:a75e:9a00:a644:3b4b:4691:92a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm12226094f8f.42.2026.11.14.12.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 12:17:43 -0800 (PST)
Message-ID: <9a75d365-fff0-42b1-95fa-8907ed69106e@gmail.com>
Date: Sat, 14 Nov 2026 21:17:41 +0100
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
Subject: Re: [PATCH net 0/5] net: avoid truncated transport header offsets
To: Eric Dumazet <edumazet@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Xin Long <lucien.xin@gmail.com>, Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 =?UTF-8?Q?Linus_L=C3=BCssing?= <linus.luessing@c0d3.blue>,
 Sabrina Dubroca <sd@queasysnail.net>, Stefano Brivio <sbrivio@redhat.com>,
 Hyunwoo Kim <imv4bel@gmail.com>, netdev@vger.kernel.org,
 linux-sctp@vger.kernel.org, dev@openvswitch.org
References: <20261113124625.4010206-1-edumazet@kernel.org>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20261113124625.4010206-1-edumazet@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 13:46, Eric Dumazet wrote:
> skb->transport_header is a 16-bit offset from skb->head, and U16_MAX
> is reserved as the "not set" value. skb_set_transport_header() silently
> truncates an offset that does not fit.
> 
> The first patch addresses the report from Hyunwoo Kim, by applying
> the IP6_MAX_EXT_HDRS_CNT limit to ipv6_gro_pull_exthdrs().
> 
> The four following patches convert places storing an offset derived
> from an IPv6 extension header walk to skb_set_transport_header_careful().
> A single chain being bounded to 24576 bytes, these need a large
> skb->data - skb->head to overflow, for instance after nested
> decapsulations. They are hardening, no reproducer was written.
> 
> The same change for nf_ct_frag6_gather() is sent separately to
> the netfilter tree.
> 
> Eric Dumazet (5):
>    ipv6: gro: limit the number of extension headers
>    ipv6: mcast: use skb_set_transport_header_careful() in
>      ipv6_mc_check_exthdrs()
>    net: openvswitch: use skb_set_transport_header_careful() in
>      parse_ipv6hdr()
>    sctp: use skb_set_transport_header_careful() in sctp_v6_err()
>    udp: use skb_set_transport_header_careful() in __udp6_lib_err_encap()
> 
>   net/ipv6/ip6_offload.c | 8 ++++++++
>   net/ipv6/mcast_snoop.c | 3 ++-
>   net/ipv6/udp.c         | 7 ++++---
>   net/openvswitch/flow.c | 3 ++-
>   net/sctp/ipv6.c        | 5 ++++-
>   5 files changed, 20 insertions(+), 6 deletions(-)

For the series:

Reviewed-by: Justin Iurman <justin.iurman@gmail.com>
