Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461171;
	b=J2w6j8Pj+rKjh2LjypFtY4in8J93gSTccPChaRfSO7bVlAizSzoEA0EVGXWntDjuC2sH
	 AsUE49EU56WmmsECuBniMUA12dabEaNbspTB4nS2iHw+swrHOQgW4uh5OiYT0N0htdyiA
	 XFl0JvDqCgRc3r1ff7EvLCYd/gACxyttTG39HJHrk9b12qEczfgYKjJhyJ9yMcC8TFnBr
	 +7iCFAPbTRWnNkt99+jGxmF2UhIjff7dyQHEH/N1FxBhkDDugAuuN5wytFIC5ACyxoR0k
	 egZu5/yQqdSLE1IQ30cr1+WZUNwV352vGHJ0zhF62/3NimvWcjVXDr6nU3PcJ0gNfvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461171;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CwyYWUWlXvyfQ1Uz5brj5h05cGnu/HuOOfVMF4CS7Mc=;
	b=5pVrMa5G30huzGECgO6PySDDILJeXr4jm5ZvWEpJh8/bn8ZwwJx9gtN1v02L9ZPw01dE
	 AwOkPA4g11PmygUDgq/TmAHLOLwFP4sgfuaKG6DT23iucENkqpN13pt6mSnSXE1n6Hny4
	 rT0IjGujRlJngmDRQwywiuCslsthTh6epbx5UlZTKqYwCiqhNsqxMjTvjYY3Ct3SUAAcp
	 FH3NVWhKpxmOW6MjCggkt8lNjqLnZ4eIYQfyPls9fp/Aoxv4lrUDTWqhtcygXbL2TYfYw
	 08QDFUKF0NkDUsBVGfPi1+1fu7fh/aIkhbyo81WCAZBNGTxmWHamuJRqCIEKkNWZljQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcXIn+SO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6728B606A334
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcXIn+SO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C411F000D0;
	Mon, 23 Nov 2026 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461171;
	bh=CwyYWUWlXvyfQ1Uz5brj5h05cGnu/HuOOfVMF4CS7Mc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kcXIn+SOi+CdOFwZbtF5n7X0Yl8UjQZuw3kHZ0anzlydUzN584hwctUvBRbOmAQdR
	 Yw38zBw53+/8dzCAw2jWTPn8S+9Su7PXyC/srOLFUKWj/vbLJ4rjrHI9axfSPU/FH5
	 Isy4LpP47aHEdWLXHOjuxxOwqAHIMiIXDnXAtvDS1FiY1QoVOjoJQr8TaP4LrF6gg7
	 4ccQYtCSoezm+KeA9W3XgySBfe6YtAPA/uTVAshG6/2hLLbdwiEVWja8JJD0GYCWaE
	 OZ+O+mNHsJ3M4A3Gat/HmO19MhprtMGZmK+CfvEb7GbU3vmpEwUTnc0SQOSVz2i9yz
	 o0zTcluqcF8YQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com, stfomichev@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Subject: Re: [PATCH v5 net-next 11/13] selftests: drv-net: decouple local
 link setup from netdevsim
In-Reply-To: <20261119164636.1071385-12-maciej.fijalkowski@intel.com>
References: <20261119164636.1071385-1-maciej.fijalkowski@intel.com>
 <20261119164636.1071385-12-maciej.fijalkowski@intel.com>
Date: Mon, 23 Nov 2026 20:12:48 +0100
Message-ID: <87jym3pdjj.fsf@all.your.base.are.belong.to.us>
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

Maciej Fijalkowski <maciej.fijalkowski@intel.com> writes:

> Without NETIF, NetDrvEpEnv addresses its pair of netdevsim devices from
> nsim_v4_pfx and nsim_v6_pfx and brings them up in create_local(). A
> following patch lets the env create a veth pair instead, which needs the
> same addresses and setup.
>
> Rename the prefixes to sw_v4_pfx and sw_v6_pfx, as they serve any
> software interface pair, and update tso.py, which builds its tunnel
> addresses from them. Move the address and link setup out of
> create_local() into _setup_sw_ifaces(), which takes the names of the
> local interface and its peer.
>
> No functional change.
>
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
