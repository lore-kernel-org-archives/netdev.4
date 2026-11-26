Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686844;
	b=Ms5PhjtdxXqbjh42P20Eyt+piJIyTe+IADctPnD2S1fTGsXM21EwgARj+cXQX8xnrdDR
	 ZZw7jROuewHe5lPy2iwk1EGTgkpUBN2hjBSGqfLtCf2TD2TGyABaULMlsTZvxxqQTyvjO
	 SWSxTFk1MwCqqvCqrjlHy9wIGHC0QjKa1Sm7+c02MwelKYOzv8iuM4WLzODMQA3cYKule
	 6rGFyS5/Va0LmdUmS0MJxgC3XDCebi3Eo1gW/ZpYqsGywmO1EKgRCQeaBvUOro5V/OdDB
	 HqQc1bRUHR8uzmb4cYd15lpoWskvVvqQVyE1QRi3NBJwQZwXAFWjYwA2dt1h0o4JUsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686844;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
	b=TDsFBywbpzIrtdwikoVNgauAwzaKYafyFxE0L0RbVDlLO0EPyCAAbvOpl24B3LTbCinR
	 IMnV4GsZVowJY7A08JbivxWPABRRDNklqnYUBOTLHZYTNAj8+z9I6d1687Oz83ZjeM2k+
	 JX5w9Q9pK8gbUnMPdyQitWD68N0/OoBPHItKPLqRSqlOEYZ3FgPqY4cz2c8P1pjFfbVmH
	 p0BbzeHSuuYYSBVHHhn4cyPi23o+91o2WJV5bo+Zwhw2JrHTziBw9lbX/Di9qszeEmEqm
	 oB7fGS6r6uTZov4gy7Y1rBTuTjdG/pSt9wP4Lg9FLphmUpB1c1SQJBOeN8KzSMiJKsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N5hMgWxT;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lLANQDpJ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD6460A2615
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAD6460A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=N5hMgWxT;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lLANQDpJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
	b=N5hMgWxTQaeHmrzOyIH1vZIdiQ1HCoMy2xfxoIglqTvGV/RvGmQmgO8dYH0bqKUnQwLxyV
	FP3HEErRk4WxU1OSVcKnWVJ7zc6LfvOpUme34S+S6O5yHWtHIYnRgeTaI72VOWkOx2rZ7a
	UBC9eBwzvgsgRlbVkH+0dagxhDaWqvs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-t0SSnx9RNKGBDa9x_0su9A-1; Thu, 26 Nov 2026 09:54:00 +0000
X-MC-Unique: t0SSnx9RNKGBDa9x_0su9A-1
X-Mimecast-MFC-AGG-ID: t0SSnx9RNKGBDa9x_0su9A_1795686840
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso30635665e9.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795686840; x=1796291640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
        b=lLANQDpJub1DKFq7TEwFDOcI3TJRHlZmh/96ElOaxlirzCADY6GEeAAS0Ytz4xY9ac
         5B1akJcEHITQjWhDe8R0Pnm0DnHAKpgdvwivbzSVQMYqVO2uQbxzKM/G0ulUAQBFOCbU
         oej8brmCszD1p185zkHyss2sZ+zOsT6Qvgpub0JOaSbzWMrEqPYip1KYARYYkNnFmv6V
         wu+0jdFe5/Tg9vPOBQ2dyGMB4w72BWETBgiI8GoSNbYX9y1MLJLbhsHuR347/DiYP+eO
         njm3nb5bzAMHRw7otWLdk9Gkb8UUOazx9ZrH/dhp1I6vG5mBOSZjRbcjITQEtmneLnVO
         YnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686840; x=1796291640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CCtYtbFe6le29oXXPU1ooKs9Dx0yxyQEI4GjlG+sf0=;
        b=xWRsTfSQijNnsI7GTR0n9vZUHcSMyIHabETrUKkYEULZZqN4Nj6doeb85bH0S2fpDb
         VmdVA9rU8fSJNWoS5XizdQYr9+bvfF2ntzp4VPIKOzyYyuHOhBYwhX60McdCYOIxwtTj
         Z+3F0WZFMz0LjV5jTlokjPgbQTFdVfrfdPEFdwBN1j3gRfoUHL30UjBIKrRHriiI0lV4
         v70mz5DVchmToyfCY+yLEUXaDflU/0nMUcskO9iDb3DMASEfBYRZ11CC03b4k+YhV95e
         6O55Dr/xgFaQavNk0b+399/iGnytZtgHkh2H3yzsqb5W+z6Q7OshhAD3QuK3iAch6VT3
         keuA==
X-Forwarded-Encrypted: i=1; AL+hErHbOhRt21epxLLgX8aR4fiL7ihEfTDOb03+bwhni/vQs7m8WqFFZ98Tigs/jJjz/gC3DEMRg7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aNE/RisegQfFK53+hlC9zOhwyOM6lghbtCvAdc0YDUgPbmdcA
	+nxuylbkUK+fAqtfw38ALwI7TrTgp+luePNAIrf3+fFJbAH0clM5FwEHc74im7TWYv474rCRD39
	HWnNUkhpNaJlGNMqH3MRRQ9qkjRM/VNRgkbTk8J+eRgMeafbEu+jR2L9l8w==
X-Gm-Gg: AZFdTZcUmwym0V0pH8eOmmSG8nkAvms1u0+cCX4ulncqxjP3+6GaBGL9Cw/QlT9YtQm
	j5st8M8JKoX+VYbwPc+4LrJgubincE7hV36/0a2YKeKf8qJhbdOz0gZ0wk8xMC89HWFt87TNNPg
	xIs15jQyQtaNyf9wfIc6vZNr3yAAmTpwD9Zlah6SvYUoN850XTCeoaukDI5doXpAt3bzAYV7UlG
	3euWjQ/wRwn9SLVdLa6bbQBT1C5Al80ZzRUgGWJFApXsnZXO5Y/ugxAof2jUUsm76jy6qFp6cWa
	ZXYvwZyPv9f5b8Vdqncnt7RR8CGF/HUrBWEFp6Bm/iJHVOebXZCl0AG4A4267KjvHPp+1WoabwV
	tmVdB2X8Ox3228IXv90IGqtCnYN9i2F6YErdyUJaaYdJiQuRUmoNKBilJmfhA0nkpyWvMeeZtFt
	sWEPDQHrkeH15G8qpSCULW4VVOpkGxq8ibSyQjSgeoTuOj
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr440507085e9.21.1795686839771;
        Thu, 26 Nov 2026 01:53:59 -0800 (PST)
X-Received: by 2002:a05:600c:4e16:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb88810991mr440506695e9.21.1795686839381;
        Thu, 26 Nov 2026 01:53:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm41250729f8f.8.2026.11.26.01.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:53:58 -0800 (PST)
Message-ID: <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
Date: Thu, 26 Nov 2026 10:53:56 +0100
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
Subject: Re: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
To: Julius Bairaktaris <julius@bairaktaris.de>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch,
 dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com,
 kuniyu@google.com, steffen.klassert@secunet.com,
 herbert@gondor.apana.org.au, richardbgobert@gmail.com,
 ecree.xilinx@gmail.com, andy.moreton@amd.com, alex.austin@amd.com,
 linux-net-drivers@amd.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, leon@kernel.org, linux-rdma@vger.kernel.org,
 alexei.starovoitov@gmail.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1795284858.git.julius@bairaktaris.de>
 <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 19:26, Julius Bairaktaris wrote:
> Commit 3271f19bf7b9 ("net: gso: restore ids of outer ip headers
> correctly") made SKB_GSO_TCP_FIXEDID describe the outermost IPv4 header
> and added SKB_GSO_TCP_FIXEDID_INNER for the inner header of an
> encapsulated packet. Every path that adds or removes a header then has to
> move the flags, and none does. A TCP stream that GRO merged with fixed
> IDs and that is forwarded into an IPIP tunnel, or into an ESP tunnel mode
> SA with crypto offload, is segmented with one outer ID for all segments
> and with incrementing inner IDs. A tunnel that decapsulates such a packet
> in iptunnel_pull_offloads() leaves the state of the removed outer header
> on the new outer one, and the inner header of a GRE or UDP tunnel, which
> segmentation reads at encap_level 0, gets the state of the outer header.
> 
> Let SKB_GSO_TCP_FIXEDID describe the innermost IPv4 header again, as it
> did before that commit, and replace SKB_GSO_TCP_FIXEDID_INNER with
> SKB_GSO_TCP_FIXEDID_OUTER for the outermost header of an encapsulated
> packet. Where a header is added in front of a GSO packet, in
> iptunnel_handle_offloads() and in the BPF LWT encapsulation, clear the
> outer flag, so that the new header gets incrementing IDs as it does on a
> packet that was not encapsulated before. Clear it as well where
> iptunnel_pull_offloads() and bpf_skb_net_shrink() remove the outer
> header. ESP transport and BEET mode with crypto offload set
> skb->encapsulation but keep the IPv4 header and its ID, so xfrm_output()
> copies the inner flag to the outer one for them. Convert mlx5 and sfc,
> the two drivers that use the inner flag.
> 
> Two flags cannot describe a header between the outermost and the
> innermost one of a packet with three IPv4 headers: software segmentation
> uses SKB_GSO_TCP_FIXEDID for it, as it used SKB_GSO_TCP_FIXEDID_INNER
> before.
> 
> Fixes: 3271f19bf7b9 ("net: gso: restore ids of outer ip headers correctly")
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
This patch is IMHO too invasive for 'net' at this point of the cycle.

I suggest targeting net-next in the next iteration

/P

