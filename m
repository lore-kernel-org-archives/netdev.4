Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774971;
	b=MbWVPYiQD79pHjGKiP0+21+6gD/JDkAyN1cilxeepZLR4hGtGwRwdHEXUEigbZp4Pv11
	 iNIWrm2+KVyNtJkey5dU1hIrghEKuvo7JUlXPFZB5W1n3CED1Tg9fMJYgh0xauhymDCM+
	 BOtRkRlfs4Pzs2VB5LViFNyPf8qM6GCY63itP3gcQiU+Kbi8qoKa1M/53cdSLxFAbwDYa
	 Iqr3BVivIuDIMp6e5bzKa391bx1+SWNoldhqbNz3U6BtetNUi0jdq4PITOdMCJURMgc0R
	 rZl7P9wxGAkaTXLA8kSIX6umOozTQn2xchiKbLdMh40dZvnLm944kJRXuIz1aWtl5Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
	b=1pfjDnJKkEeKVp/aCN3AFyI0eSjEGAhlwnw9QrvCIA6mkeu9aDBWJ6AUE68TUHXyCYKg
	 /zl5veAWUCF+5z+s6tACp41s0MZW+bwiUePpA1AB6Fy/KA5w988rjIYxrJ9QFFXf/sGBP
	 HR/zlxO+9Z/uBkSQNWDjgzoaWmOd3tNrRSSFhiomJu9rJnfIRC/giO4bCxY0Fbtefs0P4
	 LQOvrSRxhAIPzkJhdBcs8LyTfXLhAEBgSLqK908zvPOGyclpkyl2wtH0/r2b8CgrpkDbO
	 gtLs5qqlR0Y7SxpEvCbeshsQ6GHQX1+jxsYPoXCtZPKMpLGkAqf7smkn+RN/1vuGZOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEsMUJr6;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DE6606A693
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DE6606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEsMUJr6
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1429521866b.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774970; x=1796379770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
        b=pEsMUJr6wshyFZk9mSg9Q5aVI2hbLthWoh4EaFjx0AVrRXI+GMhL6cHAtiy5w3a1be
         XDFPG0+WH+n+c0BBOkCe+Vvt/F6CbykVNqo35ztzH43l3HSuKkg4xHhv2R7A/leDOkbo
         A4Smycbj8nJcb5c+Q8nNrt+zzg+CFR2dMHk8b4Ql+y/FAvNAy3oRX6OWz5aIa4uIkDMC
         xXrOtXYi+FE9kYyoNGj781TgU/DSE1Jotk282tt4reseJcYHJiLrmQ7c+2RayYIlse6/
         8JCGRCGMbQc4B/Wx7RR7nJKxdyI/i2+cNT35Zol4NyZzsw8xzXiKOvE+T3RpSbnPz3EG
         kkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774970; x=1796379770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
        b=X7bq4ABLwfcZdBGgkzNGP1vP+hWfV3mXtJxCt+RwepdVMV4c4PDNS53PmDsk4R18id
         hslV0SBkT7nZv9ImfoeFZEqokGooZmC7APF66yebH2wbs7zm+xeWR6mu/5tGJ8CkuzOD
         wbeT+1mvQNhUqQsQVB0grmPfoQIAVXxt3tTqNZ9u5d2LdyodhjT9YhkzSY8N18+JR0xz
         2IYBkfnUbxlc3/qi8u2jyxLa9oEg2CHuPt+l3sC34SZr9KQpDhZ/nX34CP+rdLwjt6iI
         FgpJxHNHxi7OTXeu8v5+UN1Y+kVFv9E7rLrl+Mx9t1p0FhRSwZsjSBJw/5+LH8q5hMxV
         vUZw==
X-Forwarded-Encrypted: i=1; AL+hErEPRt1hYmE7GnF4+xaUDEAwJ0kFbUwBY007ZXBzfwgQL/oMJvjCdW4+4v9Siw6OZogUl6/VRjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M7Z17bpzEShSaQC569vzdYHmfrJowdCSEU0pOB/ZCE1aui4lO
	1hqDRsKQFMRqEdz8XMhwAntoeSBJRhb1Igina9qUo19r+2XwEmhiKcfFYPvBZxHj
X-Gm-Gg: AZFdTZfI5E6R2q5Uonn5x/mIQhcmmilUZ1P0YIGsz5zXrg3muoM5G0z273LhDebdhgP
	Vg0U/hEhBFdX2iydWBra7xnFtftknrmmwL0+mG//44Uc2X30TSRQpU7SpwPy/jDeW5k+qSiX7Y2
	YWy0qyoe6FjeFERTiQ8/XrDQqGBv4NdGgKVHpOrJaj2Rqkp0zRPQD/8w9DOHXEP1BRUBk2w0UNQ
	QT7HjDnE/xSdxryftIDE8zW02qdRpLt2uSNJaGNQNeUIGIgBaZxT4mRGRIlDTyGRMM2/zVGfQwJ
	HxHyCbsT5BAyYTQAVDJa6pUfGCnNWcP22k3VSBBb8IF5Vjo68nKLFkZzK+QLQShQqCW5kUnA/94
	e1pp2NhnYQ0XDRpwlN4UqtE2U8Hi1P1SMwnTOCLvdjxYyHEvMuFYCqnIadUoXSej8HxhSWYXRrf
	BOhs34LcqBZj26a7VSY9uPFelOHWFETzhqnHBWuC2oAP5z/qKErWJ8CFTxDog/pL98dYKtNyl9U
	D5Ftt6AUXQzp5w7k3IQjybnDlKoeaPekTOFnWgLzV8YVc3jFk2//A3HrOCwCYpxx44jq/n+dgD6
	EPmuX2aciui7r6WcQwySifGurYmHqoijIV0NxwZLgk/19XrPXQ==
X-Received: by 2002:a17:907:3d0c:b0:c31:c767:adfb with SMTP id a640c23a62f3a-c513a274fc2mr1819372866b.0.1795774969713;
        Fri, 27 Nov 2026 02:22:49 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm895871166b.6.2026.11.27.02.22.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:49 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] wireguard: free queued packets on peer removal, and test it
Date: Fri, 27 Nov 2026 12:22:48 +0200
Message-ID: <20261127102248.49457-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179568676064.3294.9567118397760540141@kernel.org>
References: <20261126094722.73025-1-apasichnik9@gmail.com> <179568676064.3294.9567118397760540141@kernel.org>
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

netdev-bot+sinfo@kernel.org wrote:
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The leak was hit on a single-CPU MIPS router (Realtek RTL8196E) in
everyday use as a WireGuard gateway, and then reproduced with the
WireGuard selftest VM. v3 says so in the commit message of patch 1.

Thanks,
Andrii
