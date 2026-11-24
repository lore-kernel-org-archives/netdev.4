Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525083;
	b=0/7GDe3NW/RRRZeNx6A4OPCEFU5juEBXOA8j9zcRDRT9J9SRmnhO+0Lp5Ug7H1VGVF84
	 bSOOqjTWbw60VWXFG19UgqM0lUGdMyIVG9+w+Owx52785t6C+bnoeTzgULUCZeV6Jk4dL
	 dw0KK3LaHQa2lQhohcfPHqXh8SzcyHT79jNyPxhyyqbA2oviJxOdaY/zgVqlk0PUCWCUB
	 JyN4pK+nnoP2GBlsx5xZAKjvyGIMG5vZlAD0JJ3xQo/vGrBRAg/LPcldaQK9D1DQktUQU
	 t0ZEcX3pQI3sfjA4aBtw6V6BS7SABuwXmdS6WUQURBr9SHr4my3+AUDxvSbzVMFh/Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525083;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=hgAy+eka0cAq0+QLxxyu37spq/OlHMuxJnqZfMfj3RM=;
	b=QozAHSJeHKRCcb5kKmVNJRYPELGi3UapaNxCs/rqW+py2IN3HHu0oPP34HM6qh6BEUyA
	 lS0fXzSqGiU25oHIzOs0/PPA+Up1efEPbGyUUd4tSjtc0DG2AWDbxuSS/DpmT+Zot9ugO
	 3frl7RY433yncSjoSVvo0iMzLgkpVsU7Oqaqp5z9uv9zXxpk0M98R8DdgXvSpjnqWse5R
	 7ZFduO/wfyMIC6Oq8PTfqOUrEuBhiMPY+2V0xf+uT3HuCYyBeAOBYaP/kjXj3VMZ2Ljai
	 J3jBtu31Uel49x/Is61C+rzGNiajXKs9hmwx2nH73wlnBNf8MeHJnLFZoJCVYXOmXyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE4606A336
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 12:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FE4606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C12BEC0A62
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:57:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 24 Nov 2026 07:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795525076;
	 x=1795611476; bh=hgAy+eka0cAq0+QLxxyu37spq/OlHMuxJnqZfMfj3RM=; b=
	eDpyyERxpuV96dyUK926kxx80HLyWj9MdZKX8P8+DFHuH31qV6gZCmOCE0qKmH1M
	tWXUx0r76SYbf3F1gRwMuFzpYWMlLMzK478Cz0Pue8Iu6kgWpSVFb6CIWTf5N+rO
	UDN6YazGX4y4qb3/pSFdY5EPV2HlVX8JrMrOCin2wNs6cREub+UKXBunFbM/93Tu
	eMWw1jBwrRjwKIWWhxcj8aEC172v49Iq82GQuuFm4QiGsZYViAym1XcMCbzbAbYK
	71UGy6R/lKo2miqnIgcgQRfBuCATVvywIlJTz4kTjpIgel5B1xTBpoDKj7VFX+EV
	UXM3hai2reGYt8kmJhR4IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795525076; x=
	1795611476; bh=hgAy+eka0cAq0+QLxxyu37spq/OlHMuxJnqZfMfj3RM=; b=e
	sNsEjvv552J4YmD7VAyP60krX0/2U7LoMBbM0Cip+w+r9wYEzrWLa6YQbu8uXqhm
	RHVSRAiUmLOTUKy72gMZS9WjPwx53r7Z29JWfV5ZY/ETP5f9N8JiJT6zTr65v7Ll
	5yYS1ChB7YlsW0QuzriuwV7X1DxFDgTlwfb4z/C1CmpAIzcVWeHJ9YB9T/HEgSis
	pSDbZJO9rBSnofmdspNxkAXCh6jM4xpqfPsrM4dkXhz4rGEUzOQYwse/9iYSgHkf
	/18qBeFeQ5n4WaZk9LLLNa5LQT2vuHTedyn59lM1eREDmTkux+Ja86addJWfb23/
	D3y1rGb9e5T7kZaVuk0Iw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795525076; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:fyuVzYQ0q2oJ94bur5IJvAZGMj5bBqIByMmus21YZez9DgF
	iHOv0vOJ3TBIze2JnuYTvVPzVhrVr9jjzJQoJVISfimujOgosyJZ+Q8Zww61jQsG
	EWeCpQHd/DPWOA1TL/DiV/tTaicvMQO8i2DIFnqWrr8oqRBllYb41Hy+nMBiMKo9
	3gs0e9IzfoESGvVOw4iswmk/P5fhvRs2LZD6tbf8Gbg0Y50MqEJ1Byl8NQXirhkZ
	LymqFoAkSvntFTF+soqCh+pflQn9NOWPnhgsLql3mMJ8NO/hCJCHL+AyrhogXPBh
	KFJquF7zX0sKr4l+gesm0vDF7+ik7UhUvMoicyQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:mUPQZk/Ugd2v+S8N8Y/P93mAiOmiMDPbR22XCMDKqMw=:hgAy+eka0cAq0+QLxxyu37spq/OlHMuxJnqZfMfj3RM=;
X-ME-Sender: <xms:04kFa6Is6eMTnH3UGp1Z93XbkM6ztBwL1JcYIJ2DFcAia-vXaMNjAw>
    <xme:04kFayAMnEogDuKb_gAhNsBVDaSBjZZqV6_-lKM5_aYVC0G4OEOVUjw35gdnMd0ms
    vpDqjIj3mtVnBR_5oOqW7vFJ4MLjhNTkFD3ewHIlTLV_CPJpe53sk59XA>
X-ME-Received: <xmr:04kFa4DwrTsQ0QgNywj16oweAQEprr8Yq3eAFkvPdyxBnt6F_5-IG-5ylZ3b5cpWIMNrFl3gIcz-itW9CfyvgRkM>
X-ME-Proxy-Cause: dmFkZTEIJF2hT6SkjZWf7xNt2XDmCYfGF2ip/5vZexfDeqOf035NIyzz0cdKl9EoKDuWKi
    nibDGO1sJjmVEDNjIq3NtdquANV561dfZJt+nszeBvZhj7SZGLhojmu4Z6RvH4hYfk2hvZ
    0ZkBmmaq69L4JdadAx4NDdgmuWtvC7Ey7Yw/pZZcngjaG0jGQ4PA7SAMqGbarSd7Oh/t7/
    f0ek4HBMDHM294XxzXsEAU0MkLPlrknytVmQRSCJGfE/iQ2irKDtAgBc4AOGr5IsddAXBb
    JfoC1YWyJmwpEqRM8vZmoSM+3Qubgs2NuNd7hzZV6aAU60IZCGQPh3VkmBHQW70vjDSRjH
    iUsbCrX+GlPcSLrpFVdv1UTyGEX6iB+daDgX2DSqRWcy2AmOy5whIUCbTe74/pmEbM6U2V
    NkDc/rVZVc00tE63uEsGZSqzOUM6TewSYQQ8BD6OGj3EEIIseKKlssjnF6tOWvLkiau10p
    /zaQvT0JBRiprjP1wZaFc3qMU8iSny6c2lZDpEVWoZv9Fywc7OQRIjJQBIaGzhALX1DdkD
    MycD56i0LHfu8+4UNdPL/rHVMuDCVn96w7u3l+vAU5HaJUSDLUb/wqGSZt0MeMd60P2rsC
    3ZD36mQoVqIo1cw7nYG5OjI4PF6RELLnhKI/pzjQh5BZQJbx+pqa5nfItZFQ
X-ME-Proxy: <xmx:04kFa7kd00zGchPtlvZ3cGOdPcuW62582j838Tq6t1E7_DncD9rD5g>
    <xmx:04kFa-iyq23-n5Guy_sDtfvqTnAUILTTbf9_F8FCn1JZHNMDRje9jg>
    <xmx:04kFa8fikWXyV8Z6iVyux7F2XrY8Yhe8ZruTBwsttWCvV5YS_JqNrQ>
    <xmx:04kFa2AUoRApSiF21Ow6TOYuHjqeN2F2RF71Low0sDOtnOVG6lxZOQ>
    <xmx:1IkFa3ramOV1_1ewOyGZDY8B6Xpt_zVj_q0u_X0g9I2X2bv_CMYiJcEC>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 07:57:50 -0500 (EST)
Date: Tue, 24 Nov 2026 21:57:47 +0900 (JST)
Message-Id: <20261124.215747.1090155063373507910.tomo@flapping.org>
To: engineer.jjhama@gmail.com, andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/3] rust: net: phy: suspend may run
 without phy_device->lock
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 19:36:18 +0900
SeungJong Ha <engineer.jjhama@gmail.com> wrote:

> Patch 1 drops `read_mmd`, `write_mmd` and `match_phy_device`, which make
> the same claim but are called under other conditions, and have no users.
> Patch 2 makes `Device` generic over a lock context and documents when
> the `Locked` callbacks run without the lock, and patch 3 gives `suspend`
> the `MaybeLocked` one.

Can we use &Device and &mut Device instead of the new context types?

&mut Device means exclusive access to the state that phy_device->lock
protects. &Device makes no such claim. Methods that use that state
(state(), set_speed(), ...) and read_paged() take &mut self. phy_id(),
read(), write() and genphy_suspend() take &self.

Then suspend, match_phy_device, read_mmd and write_mmd get &Device, and
1/3 is not needed. I would rather not drop callbacks. I want to make it
easy to write new PHY drivers in Rust.

For phy_mii_ioctl(), I agree with Andrew. The SAFETY comment can just
say that this path is outside the guarantee.

I tried this on 7.4-rc4. It builds, and the only driver change is the
suspend signature in ax88796b_rust.
