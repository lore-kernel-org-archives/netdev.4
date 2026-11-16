Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869470;
	b=XoL0tdVTfJiRLvS+H4uMMiz58YASE2+UsM5UQsny4mDoAucCWFAMNPa67ggNABczsClF
	 IcpLf1d9a/s7bWBPiD2yNVi/WPwXGON5c1zKpgZlUOthvWMcZPFIvpT5U2yAQwUBt2gaR
	 CNUXKImTN2oEhne9+lEZBYBZgihsBCvnMK5mVqqJxt3gPRxM4KLa3ptdkQ2Za/j1I93fW
	 4R8+WC4z9qC1l//GmwcFaAEnO7u0bjde68QLYvMjkXCNKPw8t6cBEskJYOzVVsSDzRSOb
	 9d7AEcz+wKNrOf8uXB9fqqkQjcsRrfdS9au60KEqJdfy+PrOM7tRnBoTHVN7XYI53wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869470;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gtrw+EgZcRSbN30WJyks6j6TXVq1qXwqTVCSudZgUTE=;
	b=5R3+EORFyTkBYXTjCEhp/GdFmJm2XChCqFWd3lfsQOAH/yUpahkoX/ZIHdDOJr2IKX8z
	 E+69ccF+7CXVuOM8WwA+80AKlgzZ3fn2Gp3BNqRCds3+7b8p4Zy0xUp12TCXggO5XVsaP
	 JQQXcCLHl+QeiIiDLgz7rppKjna1WcGsNKdoCA9v5MIqjE5vBFUOCm9mLTxZnnDiKGDzB
	 mdPVffosbB2MqPBH2ddaW1cpihV/so3nfWg5i14uVN0DfkK+rKsUmrRwww3Xv8SA+g3nl
	 0O5CNDDzKdxkUPQn0Rtne13hdNdf67eLUeUZ9NXsZ8PmazYwK8KUq5SM4LyB+uU0SJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="njFmb/sl";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DE0606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=njFmb/sl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80EB11F000C4;
	Mon, 16 Nov 2026 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869470;
	bh=gtrw+EgZcRSbN30WJyks6j6TXVq1qXwqTVCSudZgUTE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=njFmb/sl/aXGVNNGYlbVNAZ/YOBJCXX8kYOpwvgbZzWNahSVyMZfMQhyfQcZH/+jP
	 0mpKg1/X0GyXCBXVl/q93VgKOESsN/YB/079F0qIfVWsoqz7N7OitR5yb+CztKOeOa
	 mVWDnwhLDc4i9Zy3Rrke3gb8TmwcfSxU77utG45A6aAzD0FP7qpRrg07ob3V6t6G1J
	 Zls59RiQ56k2mRNAQ9OAlXF5PcbfNHCRM07JjNmBgQRSyh6S+M44l1RtqB/gvc6J5m
	 2aWuP4fq1bS153psjj/nBy6gDQz2wfumi0KCym+9FN8UkQcJowMfu32iLDmPRBNhv3
	 GwLxrHHQUoFTw==
Date: Mon, 16 Nov 2026 14:51:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexander Duyck
 <alexanderduyck@fb.com>, kernel-team@meta.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Mohsin Bashir
 <hmohsin@meta.com>, "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman
 <bobbyeshleman@meta.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Breno Leitao <leitao@debian.org>, Simon Horman
 <horms@kernel.org>, Mina Almasry <almasrymina@google.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>, Dimitri Daskalakis <daskald@meta.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH net 4/4] selftests: drv-net: stats: query timestamping
 stats while down
Message-ID: <20261116145108.23f991c8@kernel.org>
In-Reply-To: <20261116202957.3601684-5-dimitri.daskalakis1@gmail.com>
References: <20261116202957.3601684-1-dimitri.daskalakis1@gmail.com>
	<20261116202957.3601684-5-dimitri.daskalakis1@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 12:29:57 -0800 Dimitri Daskalakis wrote:
> +def check_down_ts_stats(cfg) -> None:

This is skipping on netdevsim, you need to add a fake callback 
to netdevsim as well. drivers/net tests can't skip on netdevsim
-- 
pw-bot: cr
