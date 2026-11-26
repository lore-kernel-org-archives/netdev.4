Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.10.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681496;
	b=pDUcvY9k5vVBbqgN8ivun5ZsVjO+NtxGg4lt3VgRnbz43iYInGQO4Bogdw5eBgl/GiAc
	 qcSr8DtxoyFGqUrIJqZu0LRVJPwB5RrTKlCkX09smptG6P6G8rNrnGWBLL+TjDFrlQVAj
	 jI0m5fjal9R4ve3k/JU6PsPL8gkMg6vjkK5XaFA7t36ETIrPXvO3fJNVuN07Lo+E12C3n
	 OekVn8v9PyZqds/UYf9kBwbcNeauitgtNI5XLDrcwJDnE/RWOMu3QHLOecS+OUT65CYmK
	 GwU0JcwQNjvkuoD7yniGL3vZ5UcbYP++qwOkzuDWvflmRprlS+zKH96MflP8JPRkrLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681496;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=8dzlnUaSZFdDsrAwfjCi9BeaouOlLJhbGS2/1eIOuAY=;
	b=MaLF9NeHanW2HIXOkCR9Lwu2CXm+HM4xQidy0djKH0T1f2BbmZ4DsOSE6mkCxmwVfDOu
	 65GX0gCMLJJ56pr1pbUAu7Np16IPFtHU8r1m3ckczl7BCXrvlMoXRMBKBZqTF//zEthYN
	 SkMSfXeVPoxEKZcut6WExPZS22wMpUDlfI7R47Hle6Ah/ovaKI3TAdV9fLQ3RvWtuPbtg
	 BXeMjNbNQnMi0jHU20Ks8fDO+MhbTMTZP7awrwlGF9asGAUOrlux4WLszZfzTYDRR8KxG
	 5FfvzMEUHobRLieik3rg6csXCyIwzL+WGww/U9a0Zm8dCtpwoou9dc8+OBypI/KB67g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mandelbit.com;
	spf=pass smtp.mailfrom=mandelbit.com;
	dkim=pass header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=VthiaGh5;
	arc=none smtp.remote-ip=195.10.208.42
Received: from mout-b-112.mailbox.org (mout-b-112.mailbox.org [195.10.208.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C47606A33A;
	Thu, 26 Nov 2026 08:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0C47606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandelbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mandelbit.com header.i=@mandelbit.com header.a=rsa-sha256 header.s=MBO0001 header.b=VthiaGh5
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-b-112.mailbox.org (Postfix) with ESMTPS id 4jZqNM1nXmz5wkk;
	Thu, 26 Nov 2026 09:24:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandelbit.com;
	s=MBO0001; t=1795681491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8dzlnUaSZFdDsrAwfjCi9BeaouOlLJhbGS2/1eIOuAY=;
	b=VthiaGh5y9TeRSaWXuQ7mx1eUoa+nTDJp2H2JGs8rGmvjhMP10DNsNZWZqQ70lU1FPYd3b
	qojst/nzms+U2u/YxS98+SmUBFyXd18jnuRWQZg8dVEzIvQDJYGnWuO/JNTLcLslquZiMR
	mafi4uejAONzyXPvHcg+kcjkCdoTACtrejaDiq3CG3yjuBad5pNITcBXM4USovVwywhzeF
	jD7CI38QdkIJo/NdQCGbVkaxsnWwWLhX1VMkSutof+NBsoKLPZbtXzRpVdqiGbt7j9Wfhm
	C9I47tUvCLkB6b+Ff909gosbzAVPOgWegFnzv6M1YDZjdCckT07GlaEZsStTLg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of ralf@mandelbit.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=ralf@mandelbit.com
From: Ralf Lici <ralf@mandelbit.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Sagarika Sharma <sharmasagarika@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Xia Yan <yanxia@cmss.chinamobile.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] ipv6: advance the serial after rebalancing in fib6_ifup and fib6_ifdown
Date: Thu, 26 Nov 2026 09:24:40 +0100
Message-ID: <20261126082441.67940-1-ralf@mandelbit.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179568111516.3294.6279071790998998021@kernel.org>
References: <20261126081353.55240-1-ralf@mandelbit.com> <179568111516.3294.6279071790998998021@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jZqNM1nXmz5wkk

On Thu, 26 Nov 2026 08:18:35 +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
>

I've actually specified this in the commit message:

Reported by Sashiko while reviewing an earlier version of this change.

-- 
Ralf Lici
Mandelbit Srl
