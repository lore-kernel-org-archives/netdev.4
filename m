Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556955;
	b=Cgx4039TV7AmUi3DqYyQ51Ho9Eu19zXauj1+9yO1SrjUWj59US4UbINlAB71uTU/Xdv3
	 b+3idjLxgq69Ej4l9dcqP7/mOlm0okpF+Sb3MxWrY4lZv7UAfxF5xdQJkVh+gT2K5XhAu
	 h4ISE5fsJXhJev40ZJUEzutiv6S3c1Y78ThF9DqodBsfSCdj2yG82tqSFJhdZujsuV5pd
	 p4cfbcNA6shbGIzomUhWlx3KfARcmdTH4ZFQaZW9/3RwMEtYxOiwItU6PaeJnDKqopCuo
	 MKRxDP6C3bmVJ/r2h+ADsGDc6kfWAfjgsfScDGRKZYY6pYK+sSpfx7emKcWUtl0Jusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3qkXVXKzwajpWn2Hb1ngeOKyEma7jZ7NcWh9OzUILzs=;
	b=va02Gci8ZvwALAVDT95+GcrwqxEED0cHEODWRVebz1EJUwqBrdyC8FvwyFx/RSUMGGEJ
	 u6QpNsFdG3g99/dP6X7mAQcI/scPcYGKDJtHlJmwVSTSnuXCETugZJCV84XdbnuCbdaDm
	 XoOCK48fB0qpgNA56vrO0rLuiy8lCMmZdZiI8z7F7ZRJcroG6rwFLJIqMBG871NRxQsNo
	 NjHBnM0y/qU+rbtODm55wPaxrfa1z9gCyVHSXs9QMaqGkQXED64cz3oG4ZMIjgZFfg6jo
	 0grmIhjY+lVWyK+KCxKEN1G4mwnlSiXZEbyPVLDE1ceGyKkXlmIe5pS/XmGoo8I1unA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJTIKoyD;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F66606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F66606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJTIKoyD
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386cf1041cdso191758eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556954; x=1796161754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qkXVXKzwajpWn2Hb1ngeOKyEma7jZ7NcWh9OzUILzs=;
        b=OJTIKoyDTh0xoECF8o/vUC1ui7eVopIU6IV2xs5cys14vM7XyM5bp8puUtQ6lynF+b
         09rz9OqdNICQwIGXZKJNo3MkOtZxDUTEfIlvjFiBV9q79YwIiGeZCAjUdMGCqOGLJyA+
         n3a4klZOOE5KGc+rMvW6zyKp/DdV8tiE/PdMjhYO/HZG6/+SA9HN66QjQQ2bI96MaZHc
         kXmiUBEX0Ll3E+JSDcpiUX2gFt7luPsKi98/Qf3wiUY0zDRG7cn7mT/krWNElnH1AMzV
         8j49FoZQj6iYcnkae1tvLsKQdk0IeVUKygh6YXG2d49+SKEyb3y1z3LgaRGomOzWPIyH
         QKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556954; x=1796161754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3qkXVXKzwajpWn2Hb1ngeOKyEma7jZ7NcWh9OzUILzs=;
        b=DQBuwEtTCR6IL6WQtBEwXP215lDZsRxtejFI9BqLszJzRobNe6eZafHhRAMuF6A6Zg
         bHj5eFIxs51Pw74O5c/orZA1+cFunK7732ZFn4gp377Ys2I4x4hBFzo2iYgOsnPP5l+V
         GgvCoyk+D5GBYSnGvKgjqFa4H+02Lb5VSf1XIrBijckpoiRC6MKZJ8Nhcu8kLPA/144q
         cSLlaN/9WtOT88DbbLfLLIknsFVC5GvjKTJqMhgggC86ONsiM1kz68t3UEH1dJVtvwTV
         kP5TVsImxWWDstuhr2ew6e4ccsNCX2pXwl6s8vft1JMHHoCEtU05OfKC/6y0bBo/i/V4
         M1Kg==
X-Forwarded-Encrypted: i=1; AL+hErH6tPathOfA6SVDWgGy9s+ArPFGanN4ypKJhfn4p/LXso/43j1igchn7asLYcOvv5TrfaTyVZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+acZsiwW9WftefxhZVYkqH7rWKW7x0AqOHrzi1Cxdx0wihBEJv
	1ECMQPl0CgJCCw7LthGS0YHH26ksPJEpAwiGr1RO29Nkeg30RcyxpCRB
X-Gm-Gg: AZFdTZfCRg1cr+0gZ+3AkxUCPbW9e/cOmKKbTw109iKoK3RZUK+npR6DZiCHrskzlyv
	vQK2Fd/yksP5/sdL8fxsSPwwrPL61hw9++g1YW3+izy3lJw+gnqPducenGF5Mh4WTeurxxJPevh
	2M43vdoMcp3PfjYjDrxSfkILC3Vkx2qV/uAbl+flnNlYL48sTmm0URUJZBXV53NYinhUQDM19Dl
	/rAv/8J4FZu02QtPSuELZxZ7WSRFYE0j2m372tJwDzYPyBwGDb5szwotOWY5uWz1GGAjfVJKeIg
	EEMZVp6O5io1zHyZULYnnvDbD9jIie3iUIl4OzhiPw8NS25e6/nGc230JqFigdbYriBSTgfdez+
	Gu1+6SJ8WBR4b9ZOrWfmq2Bs3yDyB4Xd62uJqqHB8PUwjtNdnRRoMFTI0cN7p4BCEY28sWe2L9+
	bmfMa3HVpuDIefxShV+KTZCWvrucpf8NcfzPNz2j0dORc9MtCvPRgnNRoA0F1j6VKQZ0e7vUKNC
	PcnvHKIEdV8bHJq2rOFd9CK1TfqFySR6db+OnUW2E5vv1olgaxwZl1Ia04BCySRcvSykXKSbc6E
	SdmwSnwPKUJzTO3476yGTtraiiRvqClu0VwEDgNLpfSOStw3TBs=
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id 5a478bee46e88-386a3fe48d9mr11150271eec.4.1795556954067;
        Tue, 24 Nov 2026 13:49:14 -0800 (PST)
Received: from gmail.com ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm49593038eec.28.2026.11.24.13.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:49:13 -0800 (PST)
Date: Tue, 24 Nov 2026 13:48:30 -0800
From: Narcisa Vasile <narcisav.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, Jakub Kicinski <kuba@kernel.org>,
	Narcisa Vasile <narcisav.kernel@gmail.com>,
	netdev-bot+sashiko@kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Message-ID: <awYGLh6WtnvZTGJe@gmail.com>
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
 <179499144094.3136.198428718668517773@kernel.org>
 <av/RAwaDfiQnPmbF@gmail.com>
 <20261120154835.0f56c410@kernel.org>
 <awX01xqN2suPZqE1@devvm20253.cco0.facebook.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awX01xqN2suPZqE1@devvm20253.cco0.facebook.com>

On Tue, Nov 24, 2026 at 12:34:31PM -0800, Joe Damato wrote:
> I think HW USO can hit it. A small gso_size with UDP_SEGMENT can fit under the
> push threshold and that skbw ould go out unsegmented. I think this would
> affect Thor2 devices that have HW USO.
> 
> I don't think SW USO is affected, though, since it segments before the push
> path.
> 
> I'm gonna update uso.py to test a small MSS which should trigger this on a
> thor2 nic.
> 
> Narcisa were you planning to send a fix for this bug? If not, I can, but I
> didn't want to step on your toes if you were about to send something :)

Thank you, Joe! Please feel free to send the fix.
