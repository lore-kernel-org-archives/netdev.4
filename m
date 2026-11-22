Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338790;
	b=gpvvbe7zbr5wtQdAfgSI2oS9tvWl1wOFeQUHxUw4dkIWvC8uz67BYXK2k0rhvzBy6m9b
	 0mXJ7YQox1TArCXa3SmTtkDurIQW2oZeU1PjPfqCpD8UsbHsxA4thu+YbH/m/hYDEqoeL
	 rEa0LPJxfobTq+7xCBQebc43hzdnmtZzdys8FhkNMKFLuWHSYboRqrpLzQ2O4jg9VASdb
	 QXSquZEeTbTT2CtWSfe1uYcB7O1aDARHDBGeXj7Bj/hc0WbyJ1PoaIUcxMSoMvv0oHMKI
	 BmbqhFJ0gwmi4I7/djea3YoLgYln5A0yc4IF8JPyFbRcEnlHrkUj7BZqhymPtrEFquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338790;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=xffzIvp0IybBBhXSAASjYYo4f1lkq8qCVh0+MgT53sv24Bu2ssUYsjSb4AQ9PvnN2IFG
	 kALQ5VQst/mKMlaO5VHWs0HIayIUrRWGLTvkJ97RHrouHMECqGQwulNXPM6Ov4nWcCGfi
	 WggF7094I562XxdeLRI6e2+rHiKQSuCSiubNwP2tYUWkBGt/p2JiWmzQmjmut2EJR1pm7
	 DjWR1nnT1VgVrI0lv1K91tyq/+t2rBRYSOUnnOiyUpduy1PAM3S+sYUVjohu1OqVSKVh3
	 UgVXw3AelM9cUxJYk7cFzWIHNROQh+x+VE++p3aJXS4PEd3z5TlRF6kvdYQuZZjsxnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXXL+MUR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671E0606A335
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oXXL+MUR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C711F000C0;
	Sun, 22 Nov 2026 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795338790;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oXXL+MURyoOlRXLvgNEqxaXgWL+rWn8ocTS2PG3kn1AwUDiOLoPdo1GfdzTCIaS5+
	 SgaVrMchz3sqUEJXlR9Wx8w07a0ChQZeEH+/sMfE3hmXKTjBGlVRYE0XJTknZmR003
	 IeOs4njcjNsQ/b/4ImkhAVdanYY4plsGQA3k1CpWpuz5CfN3XGdVlImvLE2ZLSaKkz
	 z7WFQat5srZu1Q7qcnjHI6CCN/gJ7LWww5zk7oy2W0wqHtJjwyZ6pobFDSq1RWqzkh
	 NyopjjflZLXgnFPRVNd6BSNVWLWdYQgrk8j8XsXyH3IIShxhY6mVOC78IqUF4dpUrD
	 1wlkV2ceEmC0A==
From: netdev-bot+sinfo@kernel.org
To: Jianlin Shi <shijianlin11@foxmail.com>
Cc: netdev@vger.kernel.org, mst@redhat.com, jasowang@kernel.org,
 eperezma@redhat.com, xuanzhuo@tsinghua.org.cn, andrew+netdev@amiga.org.uk,
 davem@davemloft.net, edumazet@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 talgi@efi.com, hengqi@loongson.cn, horms@kernel.org,
 virtualization@vger.kernel.org
Subject: 
 Re: [PATCH net v3 0/2] virtio-net/dim: fix irq moderation init failure unwind
Date: Sun, 22 Nov 2026 09:13:08 +0000
Message-ID: <179533878871.3294.14009692721054097098@kernel.org>
In-Reply-To: <20261122090557.19766-1-shijianlin11@foxmail.com>
References: <20261122090557.19766-1-shijianlin11@foxmail.com>
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
