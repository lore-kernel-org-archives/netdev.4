Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168548;
	b=C/tNZLnn2RfpDey0cf5wH04Vl4fXOy8d+Y4RdsS8Ag0dSf8tMKPXTpK2VUEH0cMq3Zsh
	 92AYKNFeJ9QY7sYFnzaSQE9ujkaltxwbxTc6PEcYEx/2NDOljbGnm41e4LatQEORHkfSk
	 EBb5fjT+jSZH4y4hRejsbbjExi9hHNn4DTqDQyhKY/zN66gy1TgZ4gMGYuAxMN0xGoqF+
	 M6YiIuyNC/XH6ixC2qhAPGf2+GNdz9HsbNtR4lY/iC1mzRqSZAz6HT+Pl4mH0pkYwyWhb
	 XKnqkRLbEW4OSAibiS4dffQaiw0a+9QlmDOJl0vAcdlEkk39Hp3Ht6i0/NiLH2aDVjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168548;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=bzSpylSust8zsOiq5a5Yx/S+WNuvA9odAskEU/uVse8=;
	b=aQ13u4Pk5kC+rz9jVjysSUKQlftBPcmaypU4CxpcGdWLpY3eUi1M1Msbgt/3XHxVSGRu
	 4nnuXr9Cr0V/9Ufb1hQpTtTGUeNCBaVRD2SBkhTrcmiYmvvb5LagcRq0je0oFrjsYna/P
	 3LmW6yQcXlRm1IAnJ8BU9LS3lw9XhPGO2iGzrVd6M1moVN8n2wNRn/NNTlnhe8/9TJ2W2
	 DNmaZEiPIMoiou2ul7kQyRtRq/Z3VN2u9nzOI2Za0xulb1eZ9Ux0Hu8EUZXCp8wk9RaCb
	 hAZRqa1NISCH9n49Qu5po5hIXwUgGsIo489JtAOq07jGu9oXkqOFKDr2yP4V+uzS/nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ybHrM3G8;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072AF606A325;
	Fri, 20 Nov 2026 09:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072AF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ybHrM3G8
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A948A161B;
	Fri, 20 Nov 2026 10:55:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795168544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bzSpylSust8zsOiq5a5Yx/S+WNuvA9odAskEU/uVse8=;
	b=ybHrM3G8Es0UXB4kDGLW02bmW3fQCCYfu0g5kQWjsgFg1A6y5lFqq1/2I3mw2kx098zZhu
	wkSHl8aPweNq5NQdAu0mHn6KrzJEOI5ypBY3qY463+Qv0TLgKgkMQp7mh3aDhIAgBuaExR
	uLrBY9vDvhEATTYVL0pYLo+qpKbLnOeCMPwjzu5z70nFIJC+Bsy7gUELp113AItnwoN91J
	w/QenQtTtTJIxNSF0VwbVSsBJHcyG8uG6sEnX9YU4//GWf58j4ijPpXZRco1xKBAsIPY1u
	k1cwPviKh+UquxhmG5wB5QWC8EhpQ8T7k96mePnGZiPBHpheGJXDoRbV5s818Q==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 20 Nov 2026 10:55:41 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, justin.chen@broadcom.com
Subject: Re: [PATCH net-next v8 9/9] net: bcmgenet: reassemble jumbo frames
 from status block fragments
In-Reply-To: <179511155924.3136.1351414693099706913@kernel.org>
References: <20261118-nb-genet-mtu-nn-v2-v8-9-68f75eadf3e2@tipi-net.de>
 <179511155924.3136.1351414693099706913@kernel.org>
Message-ID: <91a0366dbd8ae1fd05dec740a644e2c6@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 19.11.2026 19:05, netdev-bot+sashiko@kernel.org wrote:
> [...]

> [Severity: Medium]
> Can a continuation descriptor that holds only its status block ever end
> a frame?

Checked this on a bcm2711. Threshold is 3584, so I swept the boundaries 
at
3582, 7166, 10750 and 14334, over the wire and over UMAC loopback.

All frames came back 1:1 and I didn't observe length or fragmented 
errors.
EOP always lands on the descriptor with the last data byte, so a 
continuation
is never empty.

> [...]
