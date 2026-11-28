Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826445;
	b=U0nK8DPOXFZEzJVils+LwPtRrjMYBOCVKyHK/U1ZIRWd6Z6MwtBZf34LXNSApLSeMzyT
	 OlNZ3C2i6fuWDdnjJd6NCzVhxIoTRazUVV0Ad/ZiWtsIXzRvP0DIRXzdwk0SkjyAzVLmR
	 YRE1PUiNniP0WNZv0VOBpQ/UKxzeCH0dnKN0SbB9+J/1LxCYb18FcElQfDQuUm8t9ahkB
	 f1N63LBSm3NKfFiohFjTOm0Jckx+I1rb7EzhCv0Yaejrtq6s0PR5NwAVpbojhS3zJoGZu
	 T/5UEKGMrxMGx6oR/g2Rm30nkdo0b7hSfZACEds4g/iEs7lKgRvQqwB2yX0aGYy0g1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1LRXfi3ljPVCU2K/+RYwxqIvg9IS2N14/NgihSvM4BI=;
	b=OojsbTcBkJiC7SvkA0n9XUJFoV2yOXU0g2Upd7akZDgiCRyjtoz7WHT5B3yxpS/GbOWz
	 dWr7NM41gzyIpyg3JhG6NvLO9IjvzgQowKrLIsSVXwMTu9nn/+VZRLn7abIsGVlyoUeQJ
	 LlipkazCJeIwa4iAxD7Sge6q/zcg6xBspXgeVgUmFJLj1bQVa99+2CRw4I1VDjJ94nO41
	 QEfk2q+cbse+lkFld+X+qJ6uPAbImgO8K0UZUrlAHVb6yHXkDJSz5jRvcfY5bKne+DWtv
	 hEa/qq1LX0q0i3B6Ytcvv4PX+PlfLmlsyb2pINzyHuZ2lMpoa8wYyT7+aUB5tYznxKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=none smtp.mailfrom=stellman-greene.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QFKEqVF0;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF0606A31F
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67CF0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QFKEqVF0
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-94958650b09so812318585a.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795826444; x=1796431244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LRXfi3ljPVCU2K/+RYwxqIvg9IS2N14/NgihSvM4BI=;
        b=QFKEqVF05ghIEVPIPyc5mGzdM/AHNZzToOiVkpnK4uGnc7Cq9CcalrS+lN0Q/joCgT
         k188LM++SxBkJCI0/excufcskDgZnLPblnVbFeZlEfLTvT/6yGWt2WkfCpQe18lmXwhs
         QFIjvLIRUKHZvznsLVa7ZdQ1fdr1q0w7gnnYg8Pem+MeUVazvJIUADsIPMbKK0KkVacN
         /QjnWNttAepXfQIc9J9G5e0FXNbewYFUIKZTmkJbQI1r7/1pZzMOUnkCD0KV46JjH/z+
         RVaA2YYYhLFFVXYvWhAoa7iQ9qJNk4n7jdlItR4dQlMemoUD3P5wqA/OUtH0FVK4cpHm
         mbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795826444; x=1796431244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LRXfi3ljPVCU2K/+RYwxqIvg9IS2N14/NgihSvM4BI=;
        b=2PMEmKspHoDjyhGIWRF3E4+BuHGXtsg/btyZ0hUJPWbju82bsWX4TnnfaMUpPuZ30G
         SxNtDb1xYiikoqSZL2ehwsgj0+HX6Hqrv9XZgj8R+AHfdjEqt4mj5OLir2rTwq6kcc0d
         q9D38Cb3HWguqp/bP83y9lPecsUzv+pBxXOOAfEk8iwRAxE3oo3Ctg+jbkA0wMztDnaU
         R5oDUBslIogoKb1B/m7OHSCQrFEk36P3igZ/xkC/+nYp+NjgPy2GwNETxiso54rZYrfk
         UkH/R6f+YdKp7QoMB42ZGKkFHAGqpmNsoQMtx6iRHLuHmImEjqvw/ab8wLB/jSGHqnD8
         uMJQ==
X-Forwarded-Encrypted: i=1; AL+hErHgDQzLRm/3Y21c1bQI8ED1dE4XQiUl3XxTa5C2aqPdTzGOqbfGZCU+ux3gkDCrVFLYD495N2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FNW49wVijZhrc1i3503smOX/tg6rjr6j208KpUNU1slgUh4p1
	uQX0HKUI9QV53u/J3IkDxJbqBG/84UC6FQgnbPQvHB369zeNNIED/dgDND3ikOuC/IA=
X-Gm-Gg: AZFdTZf8MAnn4K05rLLL6AyOn94cYzREyqt+W/AwOwUEiEV8JpfvsjGO5jtVFgXNE6f
	8H8umpYjT4On2yZDM52WNiJon/IjMwIVDwzBEmsBsSmgNbbJO4Y38ej5ccaWEPKd/gsuVKlPdH8
	yYIUsA7/15ww6JEXWeht/ei17h+cjISDNl6FrIfWge8TCfM4wz1vrlMEH+AnbYFMFq6NgUecISN
	i2Jgl4eCdUa5FAhbhPHqdCFCh2jdmb/IZqcGX8cmEw6T2lARv0nJZkex4yVG0aMPXOBDVBDvjxL
	BcwjxowzUHDBRgJRrA4lM1CJu0aLszmj86UZgRDRLbgIIF2LR8BI7rId1nQpnGXaxXRQysauNY+
	jNfhpjtwTEwMB1/YJEc87pKmdullHLA8RaaAAS0Zw9mk8LQzFfyUg+Ps8dGjV0A0BtexzcQBBsj
	o37Pd6MYkaJh27WGlMhZec6YCaY35sy0MFZmUizSL31VtqjAihLExnxBDQY9WdD732ZLrqPbI86
	8Go9KXi7RChZMvEKn2Wkc/X7cyRzvVWHO4lJAXNEHZQVuboMm4/HvRLQNmZvPqkHR1KWu45zcla
	aLS06nfIBT8nFK1LeA5n4q1jMWGYVe1TPufF2nEWSa6aLvPZ3khnyinV/zHK9VuED9KZ74ao/us
	bP+SFCNnk
X-Received: by 2002:a05:620a:2988:b0:93e:c12c:f11f with SMTP id af79cd13be357-949bab3a1edmr4751291085a.75.1795826444355;
        Fri, 27 Nov 2026 16:40:44 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4e3:fb15:aef5:60c7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38319asm1954823985a.16.2026.11.27.16.40.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 16:40:44 -0800 (PST)
From: Andrew Stellman <bugs@stellman-greene.com>
To: netdev-bot+sashiko@kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] rxrpc: Reject unsecured calls to userspace services with a minimum level
Date: Fri, 27 Nov 2026 19:40:36 -0500
Message-ID: <20261128004036.50389-1-bugs@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179582184048.3135.8278153392391816452@kernel.org>
References: <20261126224137.55862-1-bugs@stellman-greene.com> <179582184048.3135.8278153392391816452@kernel.org>
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

Thanks. The High and Medium points are fair.

High: I left rxkad and rxgk out and mentioned it below the ---. A v2
can check the negotiated level against min_sec_level in
rxkad_verify_response() and the rxgk verify path too.

Medium: right, kAFS sets ENCRYPT on its CM socket, which also takes
callbacks, so for kernel sockets the option only governs outgoing
calls. A userspace program built the same way would have its incoming
unsecured calls rejected by this patch.

David, which would you prefer: enforce the minimum on incoming calls
for userspace service sockets (NONE, rxkad and rxgk, with its own abort
reason, a Fixes: tag and a rxrpc.rst update), or document
RXRPC_MIN_SECURITY_LEVEL as applying to outgoing calls only? I'll send
a v2 either way.

pw-bot: cr
