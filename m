Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369235;
	b=FeY3DOkqgYuatZPz1DRsj5K2D6CGcDNA31rTPQKvF3FdHFy6ypPRJUIigqMveQeVkibQ
	 Q91WjgkPRfbkXsGqBo46TGft+x0LahPG0erskkMtT8smfT2oPFHJ8S7JgXmt+xYE3nMPj
	 FVd3bea4YLIoAohvnzJFyH21OiR2zE1NmzlBXH7XApHoNEwdLNYLlb2zTE4ZEYdnd56v6
	 AvUQGWGBGbFaRwqlzL/S/U14Ivu1smNF/w+fG7lQdbp9vWeFTHLu1AjtJSxuZcyejeyRp
	 +vI91AjBliidkmATyzPfcJGE9iFIaO4A5/8c+WNFT2XV15bukdoAt6JrG9hmyebt32w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yPdKG5WPu+3iWpOj22rT3wMvk9NwYQ6zarXMQgCV1vQ=;
	b=Nv7Vc1ueW5yXouAmml3OWahr7h/Zki9yzRbrFrKsrsqVOSONtNjEBb3eh41LQJ1hXPHd
	 vlbnCmGG76FMEOnpLpatIWu/tPbx2BFhxpjsi+AJVIJKTdAc1JKHzKNAlvHAIjJn2h1kc
	 Vp3MuHchl3lCu6reE0DigmJuhgd9OB5Zc9BbUikjsgKlFGmOHZlft3FSsOmnh7rLzu0sr
	 +lIwfX0sa9J1n2KZg4wddLzMakf+CDcJ0yELdV2xVb13OEgnc16ILvL4IfndApRUd+2fR
	 1llkyXUyS/omsNjRUjWzVXgFpbumJLxEYP2M0fj9wpg3g0K6WC5dSb0BBEbL5a6j7bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=X3ATZtHk;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5626B606A32C
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5626B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=X3ATZtHk
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c506a231b88so358547766b.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795369234; x=1795974034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPdKG5WPu+3iWpOj22rT3wMvk9NwYQ6zarXMQgCV1vQ=;
        b=X3ATZtHkX/ZMRGVdMMDWxb39nySX8B65qL7hSu04JNolLTuF/uIFsnxIf+uUWuaQXR
         uwPsK/m4574Rc972FoSxGzwsdq/qmb8JeHLOvGqJr6OHvQy3buC04XXVBhnyxhrj5pbI
         Q18TFAGLzNH1tKriT0I3Y+uJHKuiqrIAO0moDA6P0inWu/L7tMzoFhdBWwwHlNtMTgyJ
         cugQBA7MB660s3dNdiOWaWGIgUImVoUkB8Rjs/DLUfe1qwFgSZOtJBwT5bk4/8/sZhXq
         nGy/wAYVfsEMiN2XAAS3arBJ5kGvtiDofDPblSCuDcJ3CwR5BNtk28rbF0xML4gL6mna
         gjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369234; x=1795974034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPdKG5WPu+3iWpOj22rT3wMvk9NwYQ6zarXMQgCV1vQ=;
        b=Y4tE3RY6Z5VYirvuFlFzml66MOIiv+LLfa4t/nidQAdqUc1V/VT6kU8EZw/tldurSd
         OzcVka6VPazk1DXay60hwYmIVU7TI1hf5ovJ4IYAs66waYfFMKHMUgFWpccNgtZ/bY2W
         MLrBHF4FHHjS6+7QAu6La+vYNwewFF3w9IPbtVguRzMSIOJZeETFrrYI3R2dAyB1kdhw
         4WSElyPOA1XXXATLWsGsVtTWA9hzJQ7HaeS0BSO24wm7v7i3sr/QVp52VyztHvJYnOPd
         QqqXYwUsO101mBonTey4dfFB7SaxIgD+7yXpHccDa3Mn35R6RbdznnKt5Vc4faVwjPPT
         1MuQ==
X-Forwarded-Encrypted: i=1; AL+hErHgjAhkYjAgzss7fq63RVdfhnlmnxzVXFXXr7Y1R8S3+K5+i+z3udPebRiJPjzmFM7YGcu5yyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i/AhYs1KInUZVdFzBCDJ7lgDMmL3XUUqkTj3gFzZmf9LN5al2
	REIqmast1eCNdG7pmK63Ze1EBP4gGvlVFjyND7QK02RbrS0AKlcUuD9YBz32QzvvQw==
X-Gm-Gg: AZFdTZc1DirqNfoOAGbMRrTdUIGkaFgUpFaR+boTfx5IPcdyPHQ6ABblf4Idzx0RCHA
	COoSUMP9TGmhaNYFohPZhB7sOho+Jw79ukj/XWxjEDI2eUpLkWxP/tOrT/p66NYkgh6nGXpLYBu
	qGyO370L8MO5IxmBZ3KHknPYN3tSx4y9BDWb1goEmFkqBGoIqlDY+gy047m+sW5xD66uHRYoWcz
	8k3RW+VV7Jh+ZXLD78nr4xFxmSxExeZK4yxye1t/mZtI4lZ1rQyvNxcea4txj6nTyjZr3jSj1No
	vi/0Ol4vYQquhEgxTp7Rm0/zy/D3rwqmh4qkljW6m6VwJbZy3oV7EBx227O6M8kHMK/XZkGVIXa
	lFFMEEx0Krvwfz782SOMfEiq3vXXweuRQ99uG8lIU44tfxm2NRfn7w5XEQBRtV0x08uw0Xz9fvQ
	2BJF3y91eI6R2jUPDdNaQB/4/jgUMlibdEMGX4qRR7VvbeaJDoWNBbqoVtOZ8ITxEIKgFTMQFLS
	h4yxWib02QXQJZZZItgcCQZa8kk7FRdykt5HOheQVOKi+qjSLL8MT6L/l3EYlCH8C23dI/iAtmi
	zi+YqqQ0/TF4+707nZPnHWgC+OZ9bmk5/Q+cuC3sjDZuWaikZYbc6SVSu1YyncISDj0PzZc2JVm
	QjzT/FkYfKFa1jwJu3meixGLXwVog8TaCSyjRWaZPLn2c1vEhLlBRA1U5rYCqbmpKbe73xliPTQ
	X0spN5/wTlm6kKv2z8waQxB08rJ9Xy7Ke62p6zNzYZiE2GIb0YtSVMqqaehRRfyRlIbRBtqK59e
	IjNwngEQZlnNlTxUNIswQRbyx9HpTOtec17N5JHFe37DBt52Pir9TquvLcZ4pUTODcmuraSWRLA
	bfMQ9goP1GZrH6tjojV5I40BOJj2UFv2Qod0Ua9RBxcCt+TpaOglmZV7nwky5kqUQDQSW2PWjb4
	=
X-Received: by 2002:a17:906:1b45:b0:c4c:f85f:aa2b with SMTP id a640c23a62f3a-c513a817fc7mr555177466b.24.1795369233681;
        Sun, 22 Nov 2026 09:40:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247138c0090c03902c6657bcf.dip0.t-ipconnect.de. [2003:f2:4713:8c00:90c0:3902:c665:7bcf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aeabdcbsm331656066b.46.2026.11.22.09.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:40:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sinfo@kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	razor@blackwall.org,
	idosch@nvidia.com,
	netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	f.fainelli@gmail.com
Subject: Re: [PATCH net] net: dsa: hold the device a queued FDB event is reported to
Date: Sun, 22 Nov 2026 18:40:33 +0100
Message-ID: <20261122174033.968615-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179536905824.3294.1235394828103149751@kernel.org>
References: <20261122173347.791590-1-julius@bairaktaris.de> <179536905824.3294.1235394828103149751@kernel.org>
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

On Sun, 22 Nov 2026 17:37:38 +0000, netdev-bot wrote:
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.

Found by an LLM review (Claude) of a follow-up DSA FDB patch, then
reproduced in QEMU with KASAN as the commit message describes.
Trigger: a non-DSA bridge port (veth, Wi-Fi, USB NIC) is unregistered
while an FDB event for an address learned on it is still queued, on a
switch with assisted_learning_on_cpu_port (mt7530, felix, sja1105,
rtl8365mb, mxl862xx, motorcomm). Impact: use-after-free read in
br_switchdev_event(); CVSS 3.1 4.1 (AV:L/AC:H/PR:H/UI:N/S:U/C:N/I:N/A:H).
Nothing short of the fix avoids it.

Julius
