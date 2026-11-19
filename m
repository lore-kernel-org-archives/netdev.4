Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047924;
	b=FZipQy/eqC+CaUBZM6BpxPr0IB/yZTrl7XbuvyEhV4fdHNRirVZJFKjNv3u6sxBtu+v6
	 LSdvJebHXrcIygm4JFVj1edf5rS0VEmp2v1viIb1XVtpxCRtDJ3WGX5Pn69jdkj5x7/u2
	 mOyE6Ag6Og0vBhD3j7VDzplM51JQV2QChaJpBHZQQUd9qkHSRJkkADRDhC21NTgXHGJuS
	 j1t/mEQrJJPdElAIRRuHGvpEjJBfUd2rD7WhIpSjDOuKEV0U2kyxiRqG7N9mHQWOpbgfr
	 cDUsCOla296tyVj1XTCNEfSF7qQAa2gPeq7WMxj0Xzc7zXO9tcQCiyHjGU1sCxKPoDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047924;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3MRIr1eStxJ8BWgAmTeCfnuX3JRjOcEk44zOR15sSbA=;
	b=XKqGq/YqX/f0FVubSFSFhHZM90LLqQhcMaZ2H8fXTa3vnYzwDSLLaimgORq6vTciqPJX
	 gvWS8I3/84pcnsGNaVPWoVHPZNtE94ptt/rvjRl8Z+XqKRgYxlWb9POWpn0lr5GUrk5+W
	 zTEELge3xdtoUTzUiMA1/5SZ/YdGyOuB9jhalhQ1nAUsB1v3S6i4KpllJ4RTDYDLGm3o2
	 CRbMOvWhSsPchcZ86qnLNTkF/gcaln6mflvr5vnATPJDnQKhBqvMVjWhLqMMzMf9MpN73
	 wyA0ogSINxbqOsDmVpEmpqCRyowALGLFj774mk4mt1hdsbBuvBhv4bICiaT/ir8mh0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=saphal.me;
	spf=pass smtp.mailfrom=saphal.me;
	dkim=pass header.d=saphal.me header.i=@saphal.me header.a=rsa-sha256 header.s=protonmail header.b=FLj6YZzf;
	arc=none smtp.remote-ip=109.224.244.118
Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815EF60A2605
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815EF60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saphal.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saphal.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=saphal.me header.i=@saphal.me header.a=rsa-sha256 header.s=protonmail header.b=FLj6YZzf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saphal.me;
	s=protonmail; t=1795047921; x=1795307121;
	bh=3MRIr1eStxJ8BWgAmTeCfnuX3JRjOcEk44zOR15sSbA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FLj6YZzfi8UlgH+gv+RpMCK5oWS0zhe2et6csY8GlEIo108KcBMj5YIty0Qr1DQym
	 ireGdsZ0EyCyagq5/z+UEtZsyhFbjapMgNcDXt5vQv2weC8/QHLbWyxlwCYEvazXvV
	 gKFNLnVti0zXLc0b8rVEtR20B9I5wfiwCi+TNUmMu5t7HS87Vc3KF0nSwjp4E09F6Q
	 MMbgRVFDi5NeIq+fbrb8Xdl7eE8H8UEkoqLUew+WesxxHw2niy+CCqg7F3gUNc9II3
	 4UAujqBDV8+NuflsYE45hZrSVwMG4L2LVpJDp+LTMmZtvHlZJOp4kk+qLWHDhCRpYP
	 OdfMaSI9ez19w==
Date: Thu, 19 Nov 2026 00:25:14 +0000
To: Hangbin Liu <hangbin.liu@linux.dev>, Minhong He <heminhong@kylinos.cn>
From: Saphal Poudyal <mail@saphal.me>
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, horms@kernel.org, linux-kernel@vger.kernel.org, Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next 0/3] seg6_local: add USP and USD flavors support (RFC 8986)
Message-ID: <3dd85ab7-2270-422d-9595-c7f1d9612e82@saphal.me>
Feedback-ID: 234809731:user:proton
X-Pm-Message-ID: c3e97aebcd01d80d3a694254a5bfea697d1f2198
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
Content-Transfer-Encoding: quoted-printable

On 11/4/26 01:22, Hangbin Liu wrote:

> Kernel changes alone are not sufficient, we also need selftest updates fo=
r
> this new feature. So I=E2=80=99ve begun adding PSP support for End.X, alo=
ng with the
> corresponding selftests. The USP/USD kernel updates are already in my loc=
al
> tree.
Hi Hangbin,

Good to hear that work has been started on this. For USD, this series
only defines USD for decapsulating behaviors (End.DX4, End.DT6 etc.). I
wanted to confirm if your USD work covers End, End.X and End.T as
specified in RFC 8986 section 4.16.3.

It's a piece I need to make SRv6 TI-LFA work (terminate the repair
tunnels). I'm working through FRR's SRv6 TI-LFA and it leaves out the
decapsulation part on the Q-node.

I'd be glad to test your series with FRR once it's posted.

Thanks,
Saphal

