Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006210;
	b=xw0+qJyoufE+1DRhhBhW9qtkZtK6Eo0OPXqkNf5qqJ4oYeNlORHLksQAPN+4PAs3QZxN
	 CwTyrZgyxQ6fOv4Bjbgn5eV4EUJFdcsMMHwCHCZfywR7PtBp2BcH84Hm0LYBWcGa7scyO
	 HE14WYxCKy18vUPacQXGRsb67WMzKaMGtQzAc2JK4T/KkInf/NPtsdyP7rOIG5IV/KKy7
	 NMsQCr66OTUW/UIjOnMa3YahXkaiXwQsKYQ+ixnJySrRGP3b0f1Z4y+jnz10RbjYVvXW5
	 rnv0A3vHjIOvmsKZAjm8SXjg6GmFx1FnJPc9YkAXBKwzcUBOlxZyWGnFOt7uzxCZNiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006210;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/SM7w2WdNTF2713IzNCXPrTgJergVRTCb1DkxJ5XLFU=;
	b=u0NlF3hSWW89qUkglWh2xxzQjT/oIHTx4TwdFNe9iIjl1Qo/myA1uO/cdaMRR7PdkjZD
	 qz12BAimQRtyciB6BbByfRMGiszsi56NOm/8o2+gFGn323LRvH4Hkl25TULUZYWBjhShN
	 h+wehGEO/DGcXfSFyjuUv/lol9DnMdY5pZvhubyPWi1RoFkVYXK+63cTHPiuMVsZjVaQP
	 ema86sz3qdP9+eSITNt3tzWicVhtyYDkTgO4w9MmEw03BvpPlIi/n1J61hzOtS8w/7061
	 iIl+q77Vi3EgpnWkH6ckCtqYfBSKI04rLDWAHjSyS5sR/YGzwYAZDPMT8BYPDlWTTsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aT4zVWgF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36991606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aT4zVWgF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F3A1F000C4;
	Wed, 18 Nov 2026 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795006209;
	bh=/SM7w2WdNTF2713IzNCXPrTgJergVRTCb1DkxJ5XLFU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=aT4zVWgFsXi+vUl/ux8TbHlbhBs3/32We/0MC+GYlrtxmirLjmezK48n3xFf6TZzT
	 iRW+KxWIkxOjkgPJfSdJUdrESFw4qNWkUbW+uuMBekyirjbcgrOGbw8H5+L51wrTJm
	 wPoHPQLu7mwiQlSXfu4dodBlazzuj1OAKCQ63Cpr05XECb/tTB6gCQXPOKRNCsmIA8
	 xbpN0UpIRzTANr+1HjFkw15UC/Z61U6/5Z197nqowpnn0Ro2T9bP2plEx9iIykiLM7
	 KeOOvtLrPiAg34Q4HDqSvtVOMD3dTzXBeECM2+AHUyr6pNIowoNOqU5KsWCPdnLIKb
	 IWlnJG434DwoQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 michael.chan@broadcom.com
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, pavan.chebbi@broadcom.com, Jakub
 Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 6/6] eth: bnxt_en: restart Rx queues when their
 IRQ moves to another NUMA node
In-Reply-To: <20261118023905.3050661-7-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
 <20261118023905.3050661-7-kuba@kernel.org>
Date: Wed, 18 Nov 2026 13:50:07 +0100
Message-ID: <87a4n68fsw.fsf@all.your.base.are.belong.to.us>
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

> Rx queue memory is allocated on the node of the CPU servicing the queue
> when the device is opened. On a running device it only follows IRQ
> affinity changes if TPH is enabled, as a side effect of the queue
> restart which applies the new TPH Steering Tag.
>
> Schedule the affinity update work whenever the device supports the
> queue API, not just when TPH Steering Tag changed. Queue restart places
> all the memory it reallocates, other than the ring page tables, on
> the page pool's node, so compare the page pool's nid to decide if
> the queue has to move.
>
> Since we need queue state of the currently allocated queue to compare
> nid - check that the device is still up after errors.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
