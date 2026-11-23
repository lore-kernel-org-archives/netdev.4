Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461210;
	b=N7HY6CYLHqYSjVT8Iv8LDMGILb3jgI2t+VBW/LOXR+Z0yt7h1dQiDMeTslKDArq0Ppwq
	 eDa+x8v68xE0rcp4KlycD2dUnwu8/Em2rwSWh6+UesVyEwOWh2b8SF73KHRK/LckrqNry
	 MxCvyXKANgjJ4K5DAhT1hLz/7IeSFy7b6jLlRbFRRY+NqLLLD8rx4dHOD4j7ZRelHAXFK
	 +k5WriJKLPsLqAdbFlYYKCUbTG3aWaO3b8uq9UImeu77nL5pVzFM8AB28LwQBh7SNoR/6
	 OdIexhrkJbpAe+MZ/5OZ9BpXFXNdt3YOY5wosOU21iUJBu0TUcYkPSP0AiNupyNjbmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461210;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YR8r7f4rM1O5e4ts7vOzM/QDGbuavuSX4eKpuFwSzac=;
	b=bnHfmOhWMkbnWS/qlZaKGV22J77RaxHNA4i6rgKLyPds+3C5lX7HrDQeSXSVf+Lf2UC9
	 CAuzT0nhxy5JtyBzKZctHBRZBwUe7KkxYqOrOckv5GsW+s9S5dDwLsUbexYsHrs7V7RTD
	 /mfOAtThPmVKd3nF6wiKHkytcAjaljj4aBAfmeMGNwp/aOiOguxzeOZvzRJBr6poEnfLs
	 fDkjysOmWehWUaxnCWjCbXVm1PD4A1IMk4yHDnhR7rFx2D3efQlV2rzlfY3f1i2VbirJl
	 DCBtbr4B1Waub2KPXTGoR3yiVJIKF6abzVnZHE5AtKL78F7/YMzFuQDVXZSMDbBEAzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=queasysnail.net;
	spf=pass smtp.mailfrom=queasysnail.net;
	dkim=pass header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=nZK5rqPv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="tj/sMQz3";
	arc=none smtp.remote-ip=103.168.172.147
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB3606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADB3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=queasysnail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=queasysnail.net header.i=@queasysnail.net header.a=rsa-sha256 header.s=fm1 header.b=nZK5rqPv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tj/sMQz3
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id DB076EC1F83
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:13:28 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Mon, 23 Nov 2026 14:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=queasysnail.net;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1795461208; x=
	1795547608; bh=YR8r7f4rM1O5e4ts7vOzM/QDGbuavuSX4eKpuFwSzac=; b=n
	ZK5rqPvJW730T8tfMKB1H4oQEa7o39yBW1fSQQKqUqoZLXw0AuszIOaOjYf9p2Ax
	TjlCHOfElPl57h6Npkr//Va/WWaZhLBp/BJZTk7W/xV32ANlncU5PKw/yZWGc4F/
	TZWB63AfRedalkY2OPTFdgr9ZIViquAaEBpBt1rRvTg99IQmZUvSwI7y9+ej+kOv
	KXBgC52IAvU140j4Yjow0lRDMX2VnheLdvMkIKTe3xp7x+RT/NIMZV1EFaBD5lY1
	1BcZPZTj82E22GfQSC8nr4grzN+Qk7D+3k8FFGfIQI7edbCv3YbaWk0Yz7KX130B
	iotV+Sr63Zd8pyqYFQTvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795461208; x=1795547608; bh=YR8r7f4rM1O5e4ts7vOzM/QDGbuavuSX4eK
	puFwSzac=; b=tj/sMQz3QJQ5hK67cFojDyQ8R+niPwnun8d14W1swu+gz3VBx38
	2kUdpypmEZMoJUWWQBC6Xha14gBB2Wy0M+2j4V18oxX+HnEmDfnv/6A5brNO1Ngt
	7fPv7jo4hAGdNzruEvUEjwBr2qTCVMvnUvCHCpTuNkKCvEcsFmKidGFL0RDUY+2T
	FWLct9XU5TijAY+2M4w3rFs/CgsnIE4m5oqFsXVtcO/uI7tGduS/N6CSt3tmO1xW
	MeQZwCazEGxUxMYndq4lR5LVl9IvG4yRYvvzFusvGb6Lc3dMDnZqytOeCJaSgFan
	8Kqt+gGYqE1+yow9Uf59br9aQgtDyfSwgRA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=queasysnail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795461208; d=queasysnail.net;
	mf=PHNkQHF1ZWFzeXNuYWlsLm5ldD4=;
	rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:X/SzzVRCpu2LQZkpTCAqdUrxSKKeDozuUSWgl7OcLZd4x8m
	9E3nxyZC0h2VEmoqnJs2AFTrSLFHedbtml+7PjAChQOjHgBzprcJXTxCZEG07nc0
	x7D+hxQFFRK1qdq9Iy0ZVnrOgtqoXyVm27B2F9wDG/GMBlhcySe+wWZe3kbR8m4s
	rovx9811gsQ52DWJmrGQtgw/dgSw1+HCdBPOVztwSlnR/xfddDUjaMyYXMWKCLqR
	xTC8mW6aT0QZidRRX0U7BbyVnWlY48on9uq7QkyzjalvwNt5BJ3gwJs5lBFIQI3W
	MBrfYV5Im6YTLzEABwond+qxDGFRvDPUS1vnkyQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:v4kYJzz3IEeYSra49NR0XOJqlPWeaMimSU2Ds3Nathw=:BoV5LV//uGpHLV8n06WmOk6SLJtz+qcgP9tEglSi9uI=;
X-ME-Sender: <xms:WJAEa2aZGkMZKUyyMGa1OrcnPk2LfYiRdl01ANhpalPvH7hEhuHp7w>
    <xme:WJAEa2FA12OYAHlsz1H8zztRLe2udQrvE-ipVzCdvM70WGMBpM-u0QBhtlgAl6c-h
    _xjC7OYi24zpnrUObZlPdsklF2oAzbjhx-2PWnaiZpPatX-A5WQ9Df0>
X-ME-Received: <xmr:WJAEa01y19c4KpsMFTWuejMPWjH-zGVC1zInfyerqa8jfcaFNdOqYj7uuj8>
X-ME-Proxy-Cause: dmFkZTFGfMpzRIlRD0JqalkLOXufcldaW5mPKf9gnwsFJ+vDBNXu+ucuA2mHV3sG8awFD7
    TlQIpLKAlhdRZZzmHM5dzCLr9yCnlqE++1MlGQQlh2hXPAqwPuBKqVs+0+vPLr0jD3m21t
    KMWW9e6Nr1j2suHosCkXbxWML5v/2o8alliubSq4BLKdJ8hbk8S/De75gOw23JrVIkPY8N
    D1D3yW5QclrWuPlgXczruL49Qy/XefuKPG45Q8mhw3p9cd6s3zLGtXYEfumcXvrZY2eHdx
    vAfqlz0+MYyB1suAIuZNChzbjL65w1LKUjDuaCq/DRfI4jG14yihH6ToIZrLFbuh+tdvlf
    RM4oWrv53uYud4eEZf1oTUecOk4kxAWu3OsndNwPjHNbpfhtg2Hpg4kM2ozQDGYUFHzi1L
    5YBN7qwo6cfj7KqCQG/xTfmuMD/iU4iG9Me3pm4agOBpx0/BgqhGbvPetT4TnN1O1xSXMh
    XxRL4Lzujz+y7fJoarIv5kt1tThSR2L4E8bYBqsj/IDkw+VIPvBmE8ChB3mjVUQ560i259
    76/VteTqA9GoYlEUWcJZBCaGE6vumhPU9wxAQbU+k4NtYrUpsJezOkowezDIbB+hEqwUIz
    0S4kvOsVUUwV2jgJKb8DTKrQaDXOaY/x6HJcPwELITxClVnJ1yGdW5z908+g
X-ME-Proxy: <xmx:WJAEayzMLjpNfqkeI8W46X9Md2R7esdKT81R7NMxM7_4kKluNINwdA>
    <xmx:WJAEa1jEY_lNuGMbtT7Jq6yYnIjxIdkzk6aSlMXgV-LNnYCQNqw4mA>
    <xmx:WJAEa_PwgVNpPzWUIvB2JQmkr0VLkREePcpdqWMTj8tKCtN0r6ouEw>
    <xmx:WJAEa4dxPEaYxJyNAi3-26PBrfrXLo8CUhFLLV4gvZJv-aryT6XMwQ>
    <xmx:WJAEa2FxrWrhVk_PWcg0BKDJpqlRi6HT5g62eQHr2m019VQiU3pNxon6>
Feedback-ID: i934648bf:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 14:13:27 -0500 (EST)
Date: Mon, 23 Nov 2026 20:13:26 +0100
From: Sabrina Dubroca <sd@queasysnail.net>
To: Rishikesh Jethwani <rjethwani@purestorage.com>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alice Mikityanska <alice.kernel@fastmail.im>,
	Tariq Toukan <tariqt@nvidia.com>,
	Boris Pismenny <borisp@mellanox.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v5 2/2] tls: restrict device-down TX fallback to
 hardware TX sockets
Message-ID: <awSQVksKrzWT5lm8@krikkit>
References: <20261116183519.3314837-1-rjethwani@purestorage.com>
 <20261116183519.3314837-2-rjethwani@purestorage.com>
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
In-Reply-To: <20261116183519.3314837-2-rjethwani@purestorage.com>

2026-11-16, 11:35:18 -0700, Rishikesh Jethwani wrote:
> tls_device_down() installs the hardware TX fallback on RX-only and
> software-TX sockets. The fallback expects a hardware context in

Here as well, "the fallback" is some function that has a name.

[...]
> Track RX state with TLS_RX_DEV_CLOSED:

Well, is that new? It's just being extended a little bit to also cover
"not configured yet".

> set it at context creation and after deletion, and clear it after a
> successful driver add under device_offload_lock. This avoids deleting
> absent RX state and reading configuration bitfields while their shared
> byte is updated.

Now that feels like this patch is fixing 2 separate issues (one TX,
one RX) at once.

-- 
Sabrina
