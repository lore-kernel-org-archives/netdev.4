Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852409;
	b=Nl4Pb3b38qFECoU9BVjBnC9tvL574eKsGZ5EjkEHDEEYiizRrz/Jo1E+NLLgqSenIdx+
	 3gZrkgLaifgSFq2g/UJixEb7MOlYZkZcXkZRn/KTvl7GKm90QjGTCz3du/1B9aYzqqJ1d
	 /4sh6AdCyCajMaSxoS8EBAl6XX1ZzcpOY+CbavusBZV7EnG2T3onQ7sbTIZ3Yb7A0Kcs9
	 GMONaAoq8jloEOpthxvQwc8G+6AHE3zAJ9Rz/54PWCYHCnsfFgNANRvKp6q28ZrS3g8LT
	 paGZ2LMfPnAttPsTnmuh/T6ojyt3Ib5Oo+PLgcIpYUH9ju+QUD9zjVYg6v+1M9EGsUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852409;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ftBjVRqIQo5sgLK2NkNdlzC3vrUZKVSPEU+Oq53wchg=;
	b=rC4c6p27G5x7eo255Pt9JXRc/Vp4NSxFKn/iaA2DblG8sk1AWBAoOKqSKzf1eVLnUq4+
	 YpmUiGebje/wsHCEQ7X+KNare4FTVPQ9A7pek9zgwrELaWozs8HWkCJuI6u3U0Bgh+1Xn
	 pj6AQnM9gnYGaRLZT4sAWDAz+v3YeDkZRcZ6Z2bCcg1+dIW8sJYGGFx7yaj2bUT/HmA93
	 2oI1eWkxwGHbCoaGrqpqfL+UMuHdtvEssFq5q6H6aHdbNglH0GkiKwAXFa+HU44t0dmFN
	 pwSjQFvQvfZ5otjNcumLQVAK+pDeqpFfW5B6eRwHEFU4Pn5QYwfLQvZAlyFUPVOu+Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SK6YU2fE;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D2E606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D2E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=SK6YU2fE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BD0404E41602;
	Mon, 16 Nov 2026 18:06:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 865876023F;
	Mon, 16 Nov 2026 18:06:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFFD611BC0870;
	Mon, 16 Nov 2026 19:06:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794852401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ftBjVRqIQo5sgLK2NkNdlzC3vrUZKVSPEU+Oq53wchg=;
	b=SK6YU2fEFbs1X0NF4U3L3jXj/KdVJDb6FjFUuR75nQEt7jHD2mHPnNUw6OzsohDplUQpyf
	so1ox8YnIswvsmcHHjSMgAFTsFQEvTBlDQGfkG/s2GxAinFCADMsubPUrrqX43UoRCIxMZ
	gw+NO0N1f6cq+cj0n21k3zQHnVvzqJek/kxT7YOGCx/Hj9oISlUXFEtW7jy69Cv8ipSM3z
	DpSs0N2lemfTnkeEe2LuBDwJUq3huhvBK0sRJ2faTymS83j4lgNIx5guWMhUIV/kJuNE/9
	AWEDiPjoQ5WBZEf8RSYtuILNxyOWEZHEn3oFcKtAid9wMdFyQAh0QA8p4F1SBw==
Message-ID: <2a1ddbc8-1c9f-4622-9c98-ab09361327cb@bootlin.com>
Date: Mon, 16 Nov 2026 19:06:37 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] selftests: xsk: drop asm/barrier.h to fix the
 riscv build
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org
Cc: magnus.karlsson@intel.com, stfomichev@gmail.com, kuba@kernel.org,
 pabeni@redhat.com, tushar.vyavahare@intel.com, kerneljasonxing@gmail.com,
 bjorn@kernel.org
References: <20261116105159.1050557-1-maciej.fijalkowski@intel.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261116105159.1050557-1-maciej.fijalkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/16/26 11:51, Maciej Fijalkowski wrote:
> xsk.c includes <asm/barrier.h>, a leftover from libbpf's AF_XDP code;
> nothing in it uses a barrier, the ring helpers in xsk.h use C11
> atomics. On riscv, the tools asm/barrier.h includes <asm/fence.h> from
> tools/arch/riscv/include. selftests/bpf had that directory on the
> include path but selftests/net does not, so since the move both
> xskxceiver and xdp_hw_metadata fail to build on riscv:
> 
>   asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or directory
> 
> Drop the redundant include.
> 
> Fixes: e8f9d8237988 ("selftests: xsk: move the AF_XDP test suite to selftests/net")
> Fixes: d01fb5c81130 ("selftests: net: move xdp_hw_metadata from selftests/bpf")
> Signed-off-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

Works now, thanks :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  tools/testing/selftests/net/lib/xsk/xsk.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/net/lib/xsk/xsk.c b/tools/testing/selftests/net/lib/xsk/xsk.c
> index 6bd32caf5d08..4e9d14f883ac 100644
> --- a/tools/testing/selftests/net/lib/xsk/xsk.c
> +++ b/tools/testing/selftests/net/lib/xsk/xsk.c
> @@ -13,7 +13,6 @@
>  #include <string.h>
>  #include <unistd.h>
>  #include <arpa/inet.h>
> -#include <asm/barrier.h>
>  #include <linux/compiler.h>
>  #include <linux/ethtool.h>
>  #include <linux/filter.h>
> 
> base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649

