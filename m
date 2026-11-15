Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727590;
	b=dbXjRN5bpSOmFKohhzB35u9Lx3Z0YfetXQSKXVQW/wlfIcKm2gHmzqquBT3Z8B5pgVYm
	 49BYwI7z2xTee+JSQWJLBBJydwA9omv0iPbmowhyAbNuU4J+K/FN4PlGoW7RMOoTO2sJn
	 ARmb303scc/7g9GENPD9+Ow2gjeECeldm91Qf7Ssla+XcEGIqLXrSSOlL/ZIN3xSI2Xyb
	 sTxmXrumCx0cKb7LN4HqrOPfkEWpgN1icTRWH+vnRhs7sDBPCk/1Jv/nM+DAqG1aWPYO8
	 I60wM6gMiH0cgFKVBHsuWQODUHt942hjdFt3T/o9gzVO0vcjodgyNAymBtL37Pta2pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E9+GMMvrbPI3KC/gwFSAZGrrSd/2Sncy1Bsk5FaDLZE=;
	b=4b0yshx0dQ1zqaB97E8Dh9UhF6Sg0OJiutzRKM30h1mFTSz6G0B5AMM5Hs5hrITcju3Z
	 jEkMnEgg/Dp8VWhU6YiEL00JO/1AqNsmFbluFIqSSFnV0TQ5CAIKPTGVY2qvA4owvLRDz
	 cDzeGsqCPJCrP1mow02gDDWVRGoAbQLKP8Ju6RkuBja3LhUcWR4N7d4EI5pWtKV/iKuF9
	 WMtCIq2N4W6ySTjBuvZuZ4uQCuCMyDduA2SYcAyCqHoV1Eh29iCAxiPwJEyrKLqH7zi66
	 qnGIurDl8quAKL1zlCC2phqBwgdHiSnUIy35LEKVT0lgDOSai6y6UH+IiTobESnNUqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kfUTBPAX;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A763606A31E
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 07:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A763606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kfUTBPAX
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so3470147c88.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 23:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727589; x=1795332389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9+GMMvrbPI3KC/gwFSAZGrrSd/2Sncy1Bsk5FaDLZE=;
        b=kfUTBPAXTBJykWsMASJQOo7eiUCtt1tJjJ9XXUOcmJq6SFB/NKRcW5C3eLPY6LDjlV
         d6v8TMboIbXl6Aq+HtHYYXDBeC1TZUfkDbNoN6JXZNEYlINTk9t4i9oehl4yHEgmke1O
         RJuLjCNrt4UQcRV+p5hBmFpD14SDKtDBHmEySFJO27Bs91gK+cJ3mXbEWG1YPet36gWh
         0Xr4i6lE/QeLSl6EP9UFgLfjRQ6tn9VFQIfs1VJBvqhTw8/kVmWliD+mSmZdpGcWYMxx
         PpMqK898OfAm9st4GFFH15xRh721gcdains3XF/+Qm11/UslXpi6NeeMqLZzCY7OS597
         PgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727589; x=1795332389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E9+GMMvrbPI3KC/gwFSAZGrrSd/2Sncy1Bsk5FaDLZE=;
        b=itzwypfphGc3bgHGNZvBCjDKJvAHA4KlLBdpNUq1qCiq3aXcxQwln1Id3IInKvQ/CI
         b9DJuHGwY+TVBuXHaQpU6bj0a7TEwW13iZ8HsTcjS/puNCPmJewoF9EwLQDEltkwi1Df
         5ByWCKrkcCVrlKTle2ptxjn4QxF0D2DJNVhaBpWftuICSzOvBJ/YIKLIziVJpuhGrJDc
         Pi5qhI560geY8N4cLFjOo4eMij/Mo02/mZGH9MZwjbC8wLqU1v1Mn4iTmQr3cmRoTnIp
         +WFgdZVFztTNHlVPww5veEJELcb2TrR9d7Qza5+t+2C2hGzlntOmBG20hjAG/9hIp48N
         yERg==
X-Gm-Message-State: APuU4Z9oUK0ATAm6nMobmVByWw1CmXQLz7YLT73aPXoiP3bZPPI6b+kW
	MnrKEY9NlAZmvYS1WJLTLqIcf3x3KIjPQiIemUshceajuy6IMaoQZ7uYVSKfvcfA
X-Gm-Gg: AYBFou0TFEVlssaCqFlCG4kv+FBMHvaQbxHzxU0qXnmyzqizLLiCF9UJbRz3pOVaV48
	An/koqGFjUedBI8GZ1rt+SJMlv1eP75g24rkeGL2XMlWWiptNr2pnvsRE2fVkfhr+E8/U4RgcYV
	aynE682mpYVUD7nI1xO/rj97/wn3D3S1fk3fj8sIPIehD6j8RyTNVvZ5IAWQr0XkY/5etgLQwNe
	KG28lSRIfgVNCYWn221ZPfPJhselYjh9Uq1fkWiBYdSu9oPfdzkZDmPacBgB31vH6uPJni2LEie
	o+WERbf/VFWmGnf7YamLfnB8JU9Z+KEqajoVdEBIhayNKp4c5HixC6OeJiMYki7AGilqVmdKBTl
	GwhQsugydprEyPrK3a4f+bxZR+Wr0rqp1Qt+zqEqlN7lDSaEo+QhLayLH5c3OnbKk2B4oDAyNt8
	Z3Z/qE/huyG7v4wpFVAsejB28RFRGu/MFuhk5SK5FDtnZmlSfjHuM4zMysT31FgsOG2ONIYl8lv
	OIb0HX9HLQyamK6zEYgJx945K/xoZJM4U8AOnkuI3oVYhEfPI2nBrnmTyJirZyFxcO/bsZPpcpz
	GaKYgSzw1pSQPmooOdbhDUMc
X-Received: by 2002:a05:7022:3b84:b0:1b2:60ab:1e98 with SMTP id a92af1059eb24-1b5030f8824mr8185586c88.44.1794727589364;
        Sat, 14 Nov 2026 23:26:29 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm31847834c88.3.2026.11.14.23.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:26:28 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org,
	netdev-bot+sashiko@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next v7 2/2] netlink: specs: add ovs datapath and vport set operations
Date: Sun, 15 Nov 2026 02:26:16 -0500
Message-ID: <20261115072616.3161698-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179444894679.2199510.3381591546922833179@kernel.org>
References: <179444894679.2199510.3381591546922833179@kernel.org>
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

The bound is the one point here I agree with, and v8 drops the declaration
rather than narrowing it. These families are classic, so the generator does
not turn a check into a policy, and the kernel limit is an expression rather
than a constant.

On the other point: v8 also takes out the sentences that described what a
dump does with an attribute. Each dump now has a request list of its own,
which says what it takes, so the prose that repeated it is gone.

pw-bot: cr
