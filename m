Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534349;
	b=EnmEIjQzPDoqKiNOnCUH9Lca+Hny4tMELxaYOpyQvc6urHKLFAj3H+kWBmLUlqnUvxtf
	 N/NHd0M291em2RT29GNet1epzoB9srqfWH3xBirr7IfV8b8gbbOLDJvXPnB7TvZ+fyOhT
	 2tbZU9atM4oihmOWqqzQey1v0vyxEOHCh/09zF9hLYlqEQM3WNC2wEgBO15zVgdXhPyE0
	 OBXlKzltWBqMR77vBSR4qj9LW2R81zwu9hWJvgGbtrQ7LVMOIr8daXOp/bX7xZymu/eJQ
	 +U9lptyOgg5qFC6VLUpaSQUc+p8+Te3/a/C8R3igJhxu4Iz9VsnHndn7/S5T7MdB1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534349;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=rL3F54NaT6s6XccOCOExufYAfUj/fb6sPzRZqx0G09M=;
	b=RN78nnOieSUhVecNWMSBRAgpV/YlQS5Zo5pQMEfJmk0oGQExfI3/XgIjjUzvoD3gJDrZ
	 TpyPRBLDRWlRNEewVtNgH6FGlOwYnxnV8GedIQqRC7HfF5/NCS8GGU7CqlcumszXBuUmP
	 ZRuSoN30Za7x2c86OAzfipHDIglw3csxSZHGyoRoy1V+cqgUNQpCOGz3Qt+m7vVYvySSf
	 Pb2H02Me56h6GmNRUdOE5MlbzlxVlsaVPjUvxzNk0h+1ILZ7HLUxumjsCiTQlBdjo3433
	 dkdlHERHOApsolcedkIAArREzI1al08fdHzz7x4Rx7qw8mip9tXliTwEBVwAGu0TRbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3jJeIWvK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RL3zjBa+;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECCD606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECCD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3jJeIWvK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=RL3zjBa+
Date: Tue, 24 Nov 2026 16:32:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795534346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rL3F54NaT6s6XccOCOExufYAfUj/fb6sPzRZqx0G09M=;
	b=3jJeIWvKVeQ9U6cB7xNc1L5xqq9Q6ynniIIuS+RVpxr8Y+bI/uhPzK5kEqxCDW6eWbzlU5
	X0q4faUPeP82Q5CDCfC6oHwJ/8iL3ll1ai60aFrOit/f4ykTf77HUESRvjAup7eeZsbvIZ
	bBKM4rlrZKpc1Im65cHhsB7FAHbLbZlilAUKIz0/l9DniHqcq/yA99CCe6vjBMzgjJTX+k
	sY6O2XPY6P65KqIhGbjC2pFwHQGiBpT5A+fOdq7Zawnr9cvBSO6L1JEHH54luCO0vxQiJy
	v5JphmLN8C/z6egHNjrR+WHxqBv9YkOacfZ8s4KVargsobIHxRvcUPu50Tfanw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795534346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rL3F54NaT6s6XccOCOExufYAfUj/fb6sPzRZqx0G09M=;
	b=RL3zjBa+CEl6qVi90cU9Im1Tcf+jFmWNqvvkhUaTavl7QgayNqe6bx36FPbO3RxCy30ZIY
	egRltiI08Ql+7ZAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, j-rameshbabu@ti.com, andrew+netdev@lunn.ch,
	danishanwar@ti.com, d-qiu@ti.com, davem@davemloft.net,
	fmaurer@redhat.com, kuba@kernel.org, neelima@ti.com,
	pabeni@redhat.com, praneeth@ti.com, pratheesh@ti.com,
	richardcochran@gmail.com, horms@kernel.org, vigneshr@ti.com,
	willemdebruijn.kernel@gmail.com, daniel.machon@microchip.com,
	edumazet@kernel.org
Subject: Re: [PATCH net-next v11 8/8] selftests: hsr: Add test for the inline
 PTP header on HSR
Message-ID: <20261124153224.3v57TqVg@linutronix.de>
References: <20261120-hsr_ptp-v11-8-264c88f4f1d0@linutronix.de>
 <179551954823.3135.2068695558133971717@kernel.org>
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
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <179551954823.3135.2068695558133971717@kernel.org>

On 2026-11-24 11:25:48 [+0000], netdev-bot+sashiko@kernel.org wrote:
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 2
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
=E2=80=A6
> - [Medium] Neither hsr_ptp.sh nor hsr_ptp_test checks whether the running
>   kernel supports the HSR inline PTP header, which was added earlier in=
=E2=80=A6
> - [Low] The file-header comment of
>   tools/testing/selftests/net/hsr/hsr_ptp_test.c (lines 2-11) says the=E2=
=80=A6
> - [Low] The commit message credits the idea only in prose ("Test
>   suggested by Felix Maurer.") and has no 'Suggested-by: Felix Maurer=E2=
=80=A6
>=20
=E2=80=A6
> [Severity: Medium]
> What happens when this runs on a kernel without the inline PTP header
> support added earlier in this series? Does it fail where it should skip?
>=20
> On such a kernel, hsr_dev_xmit() has no hsr_ptp_parse_header() call. The
> inline header is not stripped, and the frame goes out as an ordinary stan=
dard
> frame. Its destination address comes from the first 6 bytes of struct
> hsr_inline_header (req_tx_port, has_hsr_header and __pad0).
>=20
> raw_recv() skips that frame because the destination is not p2p_dst_mac. It
> then times out after 100ms and returns 0, and recv_verify() reports:
>=20
> 	if (port =3D=3D HSR_INLINE_HDR_PORT_A && ret =3D=3D 0) {
> 		printf("Error: Missing packet on portA\n");
> 		error =3D 1;
> 	}
>=20
> main() returns EXIT_FAILURE, and stop_if_error exits with 1 instead of
> $ksft_skip.
>=20
> check_prerequisites in hsr_common.sh only checks for the ip tool.
> hsr_prp_redbox.sh in this directory already has a feature gate that skips
> when the kernel lacks support.
>=20
> Could this test probe for the feature and exit with $ksft_skip, so that
> mainline selftests run cleanly on older stable kernels? The commit message
> also doesn't say that this kernel feature is required.

Not sure how to probe for this since this is not advertised. The feature
is added before this test is added and does not depend on anything.
I don't see a problem unless this test is used on an earlier kernel
which does not have this feature (but the test for it).

=E2=80=A6
Sebastian
