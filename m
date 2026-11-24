Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500357;
	b=Ctb+lCWkqCtH7/za9OjnmFWa6TKcsf+LpH5xGzkQAEAyH+4XiEFKxqnXEoLafW9Gygdr
	 5A9niSLaQwZKcCg8VzAwgcvgtKI+8tJv37vTzgKBTYZSivUW2zSp7/z6deC+XanTPXyjI
	 oUpYlqmo6XcR/QY6lxZAyGmApTD20E1oBKwPrIUJcen3XkjWq+1el8+Xhglpku1pFTaBR
	 /wGPoQI+fSPpaNnFYsth2tFrf/RLK4dqOC43uZd/FOtKJ+Cko2GJoEuw9F3E1Kr98V/XN
	 vNycdaP/BkZQAjxIFR8ghMUhrjC7/FsLXRn4BynUUHvYH3BdDRZ4QaKHdjNWbKl1nnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500357;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=4EIP2DEij/76DqVwlnkFn7DeLyUZO8PFgmiv4n/cFeA=;
	b=p2dXns1AzdCaB2fxU5YrttjagRBFuzYDSM1+CqQKpIBeVn5w+xBZsG2RI4WbbLb+QCzg
	 kZGid7Vo+K05NlLpYcwN1K5eJUuy59MaxC1l8hGOVntWiLoB72goMX29aWWH6l39HpoOn
	 cKNCyIf8HuHJSScTX3tQRkuSF48JlXMTbmf8/MAqmKft7SN2Vcj0InZ76PSu3WtrSvP2l
	 MVXF9IFh5tcWuEU5nO8p1kyC33gne1aYT80ulOTH5TxWdzXx4Qrwj4LFc9hYyrHAOJV+/
	 gxIXsF8ppknwujgYZJB0CowpqAapO5QomhXT3aHamggc2zNVrm5wl6bTOWUug+UkJaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=kk53jDtl;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D64606A330;
	Tue, 24 Nov 2026 06:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9D64606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=kk53jDtl
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BED1A05A6;
	Tue, 24 Nov 2026 07:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795500347; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4EIP2DEij/76DqVwlnkFn7DeLyUZO8PFgmiv4n/cFeA=;
	b=kk53jDtlHMY9hed707i+b/Mak5Ef6WQuT+zD0VZg8OB2tamRp+M0c0XCASkJ0yzzf5vECh
	2PyFvJez2hxP4a98LbGVCGsx/2PC+0TSLX8ZtMow9OQH+SY6tUr24z2n5ej+dQhmy3bcK3
	ShGgm4Nu0n85n3pzf0F5yHMoy7JC1DlJzzEYrKFtBuC0lS00A8Yg3vvDrMTtEkD5lywBpU
	LJHdYUTI8e4F4cvWFA9c39rs2OqmavEvdKgep4ECltzPUppmalPVLmhaLZXYn2u/ypQyHH
	Timg5YGctoUZcbyHIqKKX/W62T9j/pC+54xNkvtXtqA/O1kILoGlaqGPhMFpVg==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 07:05:45 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, justin.chen@broadcom.com, pgynther@google.com,
 bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/5] net: bcmgenet: keep DIM from getting stuck
 after close or suspend
In-Reply-To: <179547388219.3135.3983701344870558554@kernel.org>
References: <20261120-nb-genet-dim-stats-net-v2-1-1a7cece7dd1a@tipi-net.de>
 <179547388219.3135.3983701344870558554@kernel.org>
Message-ID: <4f1240445e0ed9f8d3f1422d08550715@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 23.11.2026 23:44, netdev-bot+sashiko@kernel.org wrote:

> [...]

> [Severity: Medium]
> Does the same profile index mismatch still happen through the ethtool
> path?

IMHO pre-existing in the ethtool path and not stuck like close/suspend.
Also DIM recovers when the traffic changes. I'd rather fix this as a 
follow-up
in net-next.

It has a single Rx ring on all versions, so there is no multi-ring case.

> [...]
