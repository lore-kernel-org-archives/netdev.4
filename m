Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437962;
	b=NmU7Hn2QUXI07pcXL+ogbW8S7tOcUjG1llrdDMW7kGPtaZpIVJBao1x70FTvzuvEw6k/
	 NOk2+4TEkLhX3maT03bn74CB6oIo6lfDKQ6ITw/XWnH1CX+wF4Zb+0A0XCxSPcGBrkGTH
	 Rn0oXCU/xgJTjq/ZAjSpCK/J//oajUbzD/7sc2Wm7UOQWGz03i04yVxCVFE8OVQpnM9z2
	 z+vSKg54xEVFTCjRXPK0W0tqO2uFVAfL5MX0FDMTxGizCqAtIhflGG/gbK3Ap9VvXSrE1
	 yX37RLf8udri7vOuoBD5Cv/FzbmkW6Sf6S+xZIg1uifDfPGIVoU8yKUvFJv7MgTkpwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437962;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=k+m0IX8hBrBVsWLx6cEzIqWPXX+HhBPIB4+GKXs5J9M=;
	b=zAZq06TebvbxTwrW/TFfhdRSUV36RZAKrPzQjX+uGqxrB8x7dZA0+QksER7uzXYWkgrK
	 ha6Ru7OnAhqsPnUPbA34GjXmzfipT6kpAKilw3ColFCaT0S7JXoKfCH5fgFtSPd3GSQwn
	 NrkskYTm+PwS6DVzTuB/DIzO3/0pDExLiTXHniFmvxWRIYEDWLyu1bZLXN0cCTr4eFX+t
	 i2FwZPKib9KIXDOyYbl01sAxwEMuYzg8tMMIIG9toXmPJH34MazdWCxBpLmPN7OKVU0DK
	 n5+Tbxu0YQh7KzC5BnxcG0hOhKUHFQUGUtGdlxOuYFSu0TqnktKoWIKcIfmOiWYfIbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nM8l+qHp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C956606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nM8l+qHp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63251F000C6;
	Mon, 23 Nov 2026 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437961;
	bh=k+m0IX8hBrBVsWLx6cEzIqWPXX+HhBPIB4+GKXs5J9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nM8l+qHpX2CPS8G+N76arvvHWhKAIb6PyXS2EMPgDbqZNJ06elrV7/RNl4V7N6dTh
	 +JGwoPBNFAWJ4jXxcAt4Yumx7MYyjIvTOEOSnmfRXXqIUBTdGOsH5Ix6XX+rHFqoV7
	 9rAV7N9oKulwQ8jsibb/xKrt0Lc88cdDrz8+4nPvEMo6jWIsJQlI5EsL4Su6RVJj+H
	 TIQ0xXanx0afgdA3TxeIzYGGADc1tbZVN1Hg6bZHUxbFu4ZnJ801S0QAT3CupE2sk6
	 gvUeeL4wWJCMsNWPtOkSUFELvqhZ+Dcg2h+VrrKavEnRWNtsQ6EvLDttSuq5mtvWWQ
	 Tb9KraGLPBQAg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Magnus Karlsson <magnus.karlsson@intel.com>, netdev@vger.kernel.org,
 magnus.karlsson@intel.com, magnus.karlsson@gmail.com,
 maciej.fijalkowski@intel.com, sdf@fomichev.me, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 kerneljasonxing@gmail.com
Cc: intel-wired-lan@lists.osuosl.org, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, jacob.e.keller@intel.com
Subject: Re: [PATCH net-next 3/5] xsk: ice: add USO zero-copy support
In-Reply-To: <20261119165340.1071525-4-magnus.karlsson@intel.com>
References: <20261119165340.1071525-1-magnus.karlsson@intel.com>
 <20261119165340.1071525-4-magnus.karlsson@intel.com>
Date: Mon, 23 Nov 2026 13:45:58 +0100
Message-ID: <8733sr1zsp.fsf@all.your.base.are.belong.to.us>
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

Magnus Karlsson <magnus.karlsson@intel.com> writes:

>  Documentation/netlink/specs/netdev.yaml       |   4 +
>  Documentation/networking/xsk-tx-metadata.rst  |  47 +-
>  drivers/net/ethernet/intel/ice/ice.h          |  10 +-
>  drivers/net/ethernet/intel/ice/ice_ethtool.c  |   2 +
>  .../net/ethernet/intel/ice/ice_lan_tx_rx.h    |   1 +
>  drivers/net/ethernet/intel/ice/ice_main.c     |   1 +
>  drivers/net/ethernet/intel/ice/ice_sf_eth.c   |   1 +
>  drivers/net/ethernet/intel/ice/ice_txrx.c     |   3 +
>  drivers/net/ethernet/intel/ice/ice_txrx.h     |  22 +-
>  drivers/net/ethernet/intel/ice/ice_xsk.c      | 502 ++++++++++++++++--
>  drivers/net/ethernet/intel/ice/ice_xsk.h      |  13 +
>  include/net/xdp_sock.h                        |   5 +
>  include/net/xdp_sock_drv.h                    |   6 +
>  include/net/xsk_tx_uso.h                      |  20 +
>  include/uapi/linux/if_xdp.h                   |   5 +-
>  include/uapi/linux/netdev.h                   |   3 +
>  net/core/netdev-genl.c                        |   2 +
>  net/xdp/xsk.c                                 |  24 +
>  net/xdp/xsk_buff_pool.c                       |   4 +-
>  net/xdp/xsk_tx_uso.c                          |  97 ++++
>  tools/include/uapi/linux/if_xdp.h             |   5 +-
>  tools/include/uapi/linux/netdev.h             |   3 +

I think the non-ice changes should go in a separate patch.


Bj=C3=B6rn
