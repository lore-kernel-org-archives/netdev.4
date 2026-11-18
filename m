Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034785;
	b=c2PF7fjHzvp6FXxjqnybQ0pLaymNRZn9HVSpZ3Y+tyhYGZfIY3KFBwznW77zI+Wxpzgt
	 w57oi5GebjuwurBDRUMwyadB6E3u/QWKMZnMI6Vm/LtmKZ5CaFuE/yMX+UH2+hVaBdKEv
	 fvy86Cuyqz+yMpyU+op8Msd4KnXEcWaZkDfbMPD6zYezIiAFUwXwsQP+qbUX6ZZ3fwYcB
	 czkJ7z/8Sc6clvYnmG1B8oWZ0gE1CM1wRnlmLc+1nBHzkSuXxx+F/Kfqo4jyQ84KKkDc3
	 IBFugQ0gb2knk3jjUC/4RH3mo+deTFJTE8STGR7xcONeRB+qScs1wCf9Vza5HfP0ojQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034785;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=dwsCvmE+suluxQPi0tUDOo4scL8yVVHKSDn1i3wpiEM=;
	b=cFCg9HXlEF3WgA2VLSY/gXezCvYu1DkZ70pbPgkIXtdUP/kZSus8E5sisytN0plDq3ip
	 XhG4cGWgB3DkIPH8TJCMoudIORM8pp/cqdpTmvysVetU8tGZGvAj+shGIKKUlzSrTae9R
	 XBAz1CnJXXx0niuB72J67TVjB+7i6khz0ubBIXDLgwcGHqUt1wrqmNvstPTYJLGQUpVkl
	 WSa2hgw3TO7Otil3bUe3DjMGFxCOM930XxNWYJ1MI9X1e8k6eV2d9Vk5RONnMAyf/N9Q7
	 h6zx3md4cJ3kK88x/oJlzUA1KaA8gCf5IZc6BZHn74kLpseoAUYDCRWM8Jf2JVD3wRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=NQ0FJ+2C;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60D7606A330;
	Wed, 18 Nov 2026 20:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=NQ0FJ+2C
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D8CDA02C3;
	Wed, 18 Nov 2026 21:46:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795034781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dwsCvmE+suluxQPi0tUDOo4scL8yVVHKSDn1i3wpiEM=;
	b=NQ0FJ+2CkGsGJp5CWT2MRVyGg5N/0YktHM8Zz8PZMvCN0hZ9bqZZLBnSfF38jC8zguxYww
	0ktUJ1poiON+YO9VlAs3YCS/kNkfUQ7Hz+kFqv1v/x68mKqWnYDTM8DMUWDKpFu7xth4/o
	IbxT1PZH0g+c8s+x3tu07ro1eGW8jcdxAUvz2OuRv9HMcmJ7lFZtuD8W0xcPHBgQULds9y
	6fSgvEvHLJmKDI7HxeNzJFO9i060SpqRYe9UiY2SSJ5yqCG7Du6cFR8N6e/cdSghwhHjYk
	rXPbtA7assK6F0jvkY47H3UYCtqK69vWevLm9/BCaaVuXtL8oxC+fBo11PgkzA==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 21:46:20 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sinfo@kernel.org
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Justin Chen
 <justin.chen@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: bcmgenet: write the Tx producer index when
 a frame is dropped
In-Reply-To: <179503459556.3291.3443136407720616811@kernel.org>
References: <20261118-nb-genet-xmit-drop-kick-nn-v1-1-e4e54b143d60@tipi-net.de>
 <179503459556.3291.3443136407720616811@kernel.org>
Message-ID: <43a47c23f289724ea54a600d1d2f383c@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 18.11.2026 21:43, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.

As usual this has been tested on Raspberry Pi CM4 (bcm2711)
