Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005492;
	b=A2VhNgbwmJ+s6cC4m+Wjls/luCsvEafKU4tin6Shy5LDRK7af61G0OuYrESSPCx3WNZp
	 On4zKxfsvGHT8likJtmFVRmyM2uz3gnXdV7/yp7WGY9KtMJx/7DO1O53nEzOtlZbzw3BJ
	 pPXYdDy8sDWsL1zbUh3PKwaZkWQKzf9+HdcMMDXNN/L/0qPeNjepC5jXa5tiQ//0DAZLz
	 tI6TuNivLYgl8ek3VXu615Thrrkp7W19LR7Bo5xptUTpgbTooaEKY65tk0pZhoUXp2TM5
	 WgjJ2mPPhgtiigsfudnJrcmfhFHLmoBqLBbqwaphDveeAVo5ft7u636dT7rtG1C7J8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005492;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3JEg1AwzSEupesdC8S4FAgHllW0FrPrT3+DWipbTAuQ=;
	b=bQqZsDsYYoQMmAOAwmv093XtP4DQo5dNHavfjpymfLtU8bDLF43GAkWM2de+tF0rwBSH
	 792yfReo90Izlc2+cbUKoGkrRaHlGbQdHl3ZnGz+3IwJRjd1AXlCaFXM2Nert3xgTaudQ
	 mTH4Mpj0hH7QGsdFDCab1hSXhNvPjTfMX3gGU6/hO56iQE4bBG8uW6MoLUTsms0vGKF0g
	 dkKlIdL7HZsK5wVmjPWwbihGvFcMZ47uZzLPwk6oGfU5jbO90WHssTwf5C4+PmFcEW5Pn
	 jvwhWYe7GH4/Vi0AIk/NU+oWCY4w7nrx1zWmi18jv8cJvPqj/lUH9NtfVcTtYrqt3KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TEN8gExW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C593A606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TEN8gExW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4571F000C8;
	Wed, 18 Nov 2026 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795005492;
	bh=3JEg1AwzSEupesdC8S4FAgHllW0FrPrT3+DWipbTAuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TEN8gExWcin45BOxeULyT2eiTtmzFFQ79wLf60FFW4hC/bGoIDCmIMoEJ7wUANtYL
	 97L5pC5+/9sPjzi/gR9RkleQX3SnvtZ3vRXseSGfhi5s2i8Y6eeOtR4Rxhfj+oRPkN
	 NuG4BTqO7vXt4BKfVBxwioJinUsFW5DVGpPTdWnPLnRolrSJ2humil2CvngQO9pZw/
	 siIu9hTRY2VlcTTNahaXymrLhG5eOajc5pqhoHg5h2cmeIAA0AxCHs9IjSSrGrr2s5
	 dW9G4r1xrHCH/jDtCSpi5+Q5A/4QHUFTJddfwZy3g3iQnwz5BEm+9ZFIZEYtxSd0YD
	 k9HqT3twr2idQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, pavan.chebbi@broadcom.com, Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 4/6] eth: bnxt_en: explicitly keep device-only
 memory on the device's node
In-Reply-To: <20261118023905.3050661-5-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-5-kuba@kernel.org>
Date: Wed, 18 Nov 2026 13:38:09 +0100
Message-ID: <87ik1u8gcu.fsf@all.your.base.are.belong.to.us>
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

Jakub Kicinski <kuba@kernel.org> writes:

> Context memory (and the FW crash dump buffer which reuses the same
> helpers) is used by the device, once set up the host only touches it
> on the slow path (diagnostics, FW trace). Pass the device's node to
> bnxt_alloc_ring() rather than NUMA_NO_NODE to make it clear that this
> memory is not meant to follow any queue.
>
> Ring page tables are only read by the device, annotate their
> allocation so that they stay put once the ring pages start following
> the queue.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
