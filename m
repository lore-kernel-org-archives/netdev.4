Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795098265;
	b=rceJVOC7wqlCM68fyn4OuSqzeX6i508zUVpPbxI6OljKM+SvYjQd/tdi0JjXvBxHFdJc
	 hdQLlj8ZFuIGUQj1Bfh37eT8E01wazrvWho7f+Eux0dQW/UTA7nrFdRzx2A2bQ9pjzImC
	 exDd+VijFMcDY8pmsyXyV1N0ylc3f6JM/qbQ6v00SKNQ0pyr87dG2x/SFvgBoUPE4CGid
	 FQC07BbLljaPvFmkVmxOl3yyp1WLVv87oGGLoDwtE0vZnaCSQfG7EGiq+RkVHGn2haCF/
	 W8f6aJLT8CTd35AKE3JwkB5O8S/5Y5Nce31x92owtTel1aWzZi84UR8AqH3D2IbEjcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=o5n51x59sxtfs0bspBXfBjL3tD09TlDgiTXE1CgF8cY=;
	b=1wNP4tb1B5v93yVpSEbbkDxfcCQsuThKWnzxcJnd/jpxghtPWxr5Bno2IEWckhiWOfXT
	 7e1vjK76+i0g4aOulGJwMbOeb8V3PjUnSXR3TSgOqf/M1Ko1dJNqSu7V58DWAzJkbY67w
	 adxVBL4yS/O6JMk1556VhLFSWv057VlFjHHlCrR9z9uyfJpdjtm5lpeCBQ9eKHAUWIN6o
	 fxTaKCqKbPeCucqnkaRWY7vYv9vTq9ZpZBZpdRgMr1Wt0Pq9YMBpQy09moGePvIxGQEZt
	 edQUZGsr2wBDHHsX3st2hQO9mp5jcpV+0gl0+TYBzLfTNNWcU3iC8k0H+fgYkYyEnWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NATJwU+x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69C1606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E69C1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NATJwU+x
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71ae5389c00so1579556eaf.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795098263; cv=none;
        d=google.com; s=arc-20260327;
        b=rl//b/kLVqvW3+h090OgU3CVLsZWwJRtbGptFgU9yB9Jh0f2syL4LmOZgXOXLVu1lw
         Wn0VGzCAkELkLjeJWN6yz41zN3MAQgxitYnvXLcwxkgQz9nYJ1CYuQQoUaKohrjg5MsX
         Qb9o5E1qjhDF423NgkjWS1/eESeu0QRsqplEbzqxryh8WBsh/Icj8Cxl+VSLJTZeG8wc
         Y8kdbCnSrFsABPoSkUzlsrLrbVS8yjWB64MKHfHT8jOLGd4E/l9kMBl0svx0mM6kqfZC
         YoIbj6/vJFTeeGyXXKbqmVlzKON0tMFXeqCUSz48FILjnSCqM3++IrY0AbNwqvPSep7o
         gFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o5n51x59sxtfs0bspBXfBjL3tD09TlDgiTXE1CgF8cY=;
        fh=Ey/AwV+EH9+b5KBCySScyXs1gd1sWuCy9eq+H7i9Ztg=;
        b=FQRDDqUYt1ATuuzaQVbllMLmUWTlyrpiYnCktBhfz4iTh37uNfVUPv0ZWR+TTS9cq9
         2qbid89/LVpHBF6sYDTy0G+LBoQrSwnp/HV2rZSaAO4dTcB0+70sH/bv8WX4tanytrIR
         U1eVNL49TdOHlY6xwhvEllDKTTEGTTRvnnLxqcy32ZB2PuwyOFHKH6v741uPbRtiCzQ5
         9rzz3IhhgiVYTEb4cTh+plJEKmG6mapSTdvXpy9Ed3rDb1g1dseiT8kvfGfR8UPIvFtv
         BvwAxqknekwx6GFotY6+bB8QR9e1K99Way05Rx9Pd0+KJfWPN4nzY5TY9foK/bFRHGs8
         8bDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795098263; x=1795703063; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o5n51x59sxtfs0bspBXfBjL3tD09TlDgiTXE1CgF8cY=;
        b=NATJwU+x+h6AHV7vGou4j3ono/Md2OV4luDyjboci7TCmuKFe4/+jUTzEY3qeCkODm
         Jdf0mQMp3pWUIR+H53ljsFJxs58GZf9hhs+iwv99yk3jycz0TeXgWLoDwKMIfxcxRYMB
         aT0BJ/j+lFkAIse5VR4AyGqJd4jHFMqWoNCrhm6ablapl8s8PLf0P2wtxBLs0QbAG+sv
         N/F5ZXOBR6H8/3yqRMYYyx3dSnlhN84oKjGPP6b8dTOYbpMs8wLrIsZWePuvE77uNeSz
         /Q3Db6GOZVszJ10GQIP7ssJz+DlMr6noBug64h7R9UqQta6VVtVJkumfxsHUQndEXdyq
         TBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098263; x=1795703063;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o5n51x59sxtfs0bspBXfBjL3tD09TlDgiTXE1CgF8cY=;
        b=v5cj1Qqay0tRh/szyo0KDT3DahiSvQdeT2B0nasohC2/Iy2N1du44Xw4SW/wwgS370
         XKksusgJwpQvIsjAotzC3rvJorGIt72WJ/ozLOnSgY6SoTjmKpR9JiZQTWkTwpJyXLJQ
         yToO/7koEXMcFD5Ft2kfpf92QKZatE1A+E/cSDfvWj8fVtYLW4vYSWC8uloXC/ssvcd4
         +7g2TJW0jBvKHs1xmQkJSmQi38Cbhu+cebFDp8I2TPm70lWjGqut8UXUDJT7pJb5+oT+
         L2grCPnAi2A01+09JKBVdjR8pkE4+w7imivuxKerMaKeLQ2n7FS1msvpOgkK6FdSQSbT
         NckQ==
X-Forwarded-Encrypted: i=1; AL+hErEAKk5jeJfUcplk/4yZQXyhafZkKvn/aT0Jqk9gzKVqM0l76Mjc0c7bBc6en0qZnJrO+M2bZTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jPzYsFhWavMVRo2uwPqQfs31Qhsb5xTpIuWVfCJ5KzGey6cDw
	Mw3KkvO3b2+//3U3mkW9Ogoc3E5igoLZYOKhCIEd8ZXGa29PzSWPc7QLZO+OQXd7LcYeweQNBo4
	zvnUSBNpufqc78OfU8xW40RnH3mNxZnIxGLCvGn8B5w==
X-Gm-Gg: AYBFou3BidQEeYoAQL7xAydFOspVI22VsHOFqTik0yklPXpDkOI3kb6Q+oAaqX5cYUz
	3KB6VK6um/oHeyjYgRTJyObuzxxVl4P7CHIxinkRSvSHcSHLn+CDK0lWeTEj6+8GNPJgZPmZdex
	fdTHgQN4VO55SKW8dPXW7Ak3cZd0zPHBvBaiTko8XQ5isRvBiBm2nyYIp4OCmhBOni5ET5pePk0
	VbKMO7k0g3Y4hNiNby7i/v6TG9JnNTSiQAlDjxgWSZpC4usIKGb8wlw2ZRd4UNRimG13BMRtGVS
	q4Jq/X9CYg6e5mznsg4wFEYa2OWa8leST5VYPgZpWEvFXSHoxDM1mFczyzjVW8ihYpRRtt7Q10Y
	ckd61zkKwloiiN1nynj3y7PBIIwwyVAO3v7RXciL5XFcta7cdoTokNDxRcvemUpK/d+U15vxdmW
	xU5EYlOo6bwQ==
X-Received: by 2002:a05:6820:1355:b0:71b:193f:2eb1 with SMTP id
 006d021491bc7-71b193f3492mr4490832eaf.1.1795098263194; Thu, 19 Nov 2026
 06:24:23 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119133032.2015656-4-sst@poczta.fm> <9a5a1487a4676381f4c3d98cb5a22f50e2f54d9d4ec7947891c889b64ac12693@mail.kernel.org>
In-Reply-To: <9a5a1487a4676381f4c3d98cb5a22f50e2f54d9d4ec7947891c889b64ac12693@mail.kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Thu, 19 Nov 2026 14:24:12 +0000
X-Gm-Features: Aa3M54pU7ZbLxGTK6OUaJJJ5wSY671yMAwh7XMSPppG-d1bHhduINP_cjWCI05s
Message-ID: <CAG4wq-favnH37jS2=a-aJwBgQOuW=KTsM-vJWp73PNDfFq4=ZA@mail.gmail.com>
Subject: Re: [PATCH v7 bpf 3/5] veth: use the frame mem type when running XDP
 on an xdp_frame
To: bot+bpf-ci@kernel.org
Cc: sst@poczta.fm, ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net, 
	kuba@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, maciej.fijalkowski@intel.com, 
	tavip@google.com, toke@redhat.com, aleksander.lobakin@intel.com, 
	ilias.apalodimas@linaro.org, lorenzo@kernel.org, magnus.karlsson@intel.com, 
	ihor.solodrai@linux.dev, edumazet@kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, horms@kernel.org, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, memxor@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org, 
	martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 13:54:58 +0000, bot+bpf-ci@kernel.org wrote:
> Is this Fixes: tag pointing at the right commit?
>
> 718a18a0c8a6 only reworks the skb path (veth_xdp_rcv_skb() and
> veth_convert_skb_to_xdp_buff()), and does not touch veth_xdp_rcv_one(),
> which is the only function this patch changes.

I think the AI is wrong here. Before 718a18a0c8a6, veth copied a
non-linear skb into one linear page, so no frame with frags could reach
veth_xdp_rcv_one(). Either way, 718a18a0c8a6 and bf25146a5595 are both
in v5.18-rc1, so the choice makes no difference for stable.

Cheers,
Tianyi
