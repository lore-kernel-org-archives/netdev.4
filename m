Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396683;
	b=Ds5BpRbQ0bGt+5pqZoPNXUd5zX1XI+u9pmShPZIpSp4rT1FtdqZeXs6hgqIoHxfJ7Oxr
	 VpnRL5fths4ESvr1yAaWC0HJ4actaPyHIaF/qBcsHe+2EUligOnX4+ZmkBZKCWoW/P8za
	 7ExAB0Big8bHejNS6kWZD05teCniHzZX7wP8iAuR2WYuE9AY+5qWTFJvr4yQPJl4cpnU1
	 DvF3JaczN+ohggiSwwA39jDvU98zhfLKINGnmBhHtejvwyv3/GJkcrA3ocYL11cUo2WMB
	 Je+8QQYlnV6I8reQRyn2sI6U1qJBC3RvLiioHpAtbCfLDDnWJftfWaoRq78WVgHH4Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396683;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=nAPReYFM4lDV6YHjTXYQASQShygnVM0I+OJUJu+LR5gYy8UV6kzEyMey0WvHvJmklX0J
	 7qEMDd5DzdI/lRJAzBjjNxfJnMuRj/h/uzp7Wm5zMDTcvMSvPB8RfS9DHhaqMT/3AWzAX
	 +Pw0dyMcrspyH2iMuGT+KYB7iwB2Ejawie8jb+WSQlPdU3mP4VOOAluY98f0JOP90UDZF
	 kAcxKqDOqttGHD9jkKpK+PS5qL3YsOEuukPVfQ02ufEicucM75lndKyhoAZiCrzvfc8aT
	 HJHV6hY3C8/o5M8ox/aXj+bE7C+cU1AIp/HRz18JDa+QHbVpeVH6+s6QnZhZIIrHl6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivFUn2ds;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F28C606A31A;
	Mon, 23 Nov 2026 01:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivFUn2ds
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6721F000C4;
	Mon, 23 Nov 2026 01:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396683;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ivFUn2dsHXRsZxa3FiGCOxtSaG6tRmjYylNqA9/wbR5bnVf5/H0dKmf4OTqwnMnA0
	 LnokTRWCYIALSdI4jPaS84UPHwL3MGQtVhKrNT1bLHKfhuzI7zvM4iLPhThzORdEtq
	 /R0TZJmiE1UdRfRIDlAFr3YmB8nYQYEgcOhEcB/xsAa/B///oCfJ4xdFuNdKjuJwIL
	 CgP9qVNBfc/wZYLS5YxbYj5T0OWjGhxBUB1AKZ6KuxCXEHrnhV0YTbxjg30BBNYBKT
	 FhX/qFgusYHPaugGIlWyAjlwSNmX1P3cQUiDAjTpC0y4z2O2kGJHMqL2lY/QPxNEJZ
	 YI6RABt4Y35mA==
From: netdev-bot+sinfo@kernel.org
To: Lin Ma <linma@zju.edu.cn>
Cc: David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, netdev@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] rxrpc: Fix overread of short key descriptions
Date: Mon, 23 Nov 2026 01:18:02 +0000
Message-ID: <179539668255.3294.13468714473453034116@kernel.org>
In-Reply-To: <20261123011302.4032262-1-linma@zju.edu.cn>
References: <20261123011302.4032262-1-linma@zju.edu.cn>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
