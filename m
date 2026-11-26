Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697676;
	b=iNHF9XSe75SrZGedPy1UAcU/mn52D7QetrPb4muqzqjJl+JxIVxt0hse6Fs90a5i3bt5
	 tUEjzM5oDG6csCuZXYhO4oO8oJvOwGeEmy8KQMc/YqCv3H4t14oGNjOpdVVRg5jvlp1k4
	 /RdU6Whj7rX8S5Kpgo3+1scg0Es5fWyJSUmbixJJnGXpL+GGZtnYoD8ie9XaMY/l8D/AC
	 I/lrZpYET/DbhfN8NESOkRgv7/KuFftH7Hkzr+/JCG7L/k5+1Gv6yFniJHV+vUiIdr6aj
	 hyhxXnSv85h/yWJyrbhgWDb7FynGqkMIJP/eulT3t6qDY7mGIKCJ8vyY+AytQpfKkug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=cXVl/ygho6Ssl3TCBW3wmvmTGM7KyArEoxL7coyEBqk=;
	b=TpFZxR561gPHnilSnSuKXVBDb03T0n0rwK1H3vIG/mtXtqN75DPK+u9Amqh7TVxNQSV+
	 7rpuU4T7v5vWlxexhhaZH2g57weiC7vSvjDRjaY/k4wUox9sKIbLSI4++KmOUQbIIJ/pB
	 aJdHQB3VuXqqqoPzpzf9wowM7f8E33jG7JV4wxJLguh86jOa8B1JWYduKiJWFOs/G7ApM
	 79JMMS4hK719kAr8ocxYGi37pxkYigVTvy1zQ0pQR4s3S/uruIUxibs700Nbd+AY4oVc/
	 ia9bSbVswO+HmpyT/DIGnY6TX2+lEpyssclkROpa37U/xehQXq4Zebw41z0wClwZMTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z2xpMjaa;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9364B606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9364B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z2xpMjaa
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so2481982eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697676; x=1796302476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXVl/ygho6Ssl3TCBW3wmvmTGM7KyArEoxL7coyEBqk=;
        b=Z2xpMjaanMJ82LX7pQ2ezX4RziNwDc8MZLUHOci9CFYGHFWbgliUnvOfl4xOKsjPrS
         HdgqiveAtCUfbM+7nZT99QifRIkz4upETOtiqZvPTvkuWx7MGRIrj1mfpTHBpbQWFhUT
         AjbObTBG9ST0ryLxd8bYdUUrLmDGrLYZ7jZSlmOMfYGpJjejLZNQSss/yFVO7I0MZE6Y
         3oGBVKp5hZmrNwU0RvtoWIs3v+HvGKfk3fxUU4KQEG6IA3Pnagc2TikH55K3Jp4M1YUq
         n/yS+54iW3Pr0UTjK5Nt58eef9ncQz/O8WlSmkj23x5Iz/2hy9vpfyRJqpLpD8qk3DZm
         cSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697676; x=1796302476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXVl/ygho6Ssl3TCBW3wmvmTGM7KyArEoxL7coyEBqk=;
        b=c8p2Xw4g/7ueHxiFmZ94wnapJjOVZZCZnnZvzB4/9qly4tTAOaTylHDJm24JN2yfue
         NvjpVZxOj7vOX7MmUDYEjBrpzqHZGgMA8KIeStG4RYiAvhaFLuL6n/NLielAA/1pDuKq
         y0CfNaALDPOBFgXCrD7VDyJvL2HXjOoQUiEFz1MIvF8NQ+GHMcKnH3IPZtGQqGAtaW9a
         zdLGmVNU0x3RSPGZMnXYsdhoE6oDJNkJaBZfP8SIhUlVwyLRt6MwYM/l5B5U7x6Q45BN
         jsfcuMGP4IcwXih/HF7uK/eefpwdpfdmlg8RxaZ/K/fbhg6yEbfoM/5+LeASdZVaoIF5
         5IxA==
X-Gm-Message-State: APuU4Z/5EMB3i3qeVrUxtkn+jgUBWdlbR+sAbUsDwN+GFqXGbCuQ7PZH
	tCdAmSpBZG/E1ZuCxYYJketiM9RSDr20aejtv7aL732P+W0pn8Ehc0oL
X-Gm-Gg: AZFdTZc4gR1wi46k4+8Yk5jae/OfRdGEIvMvoraxEX7TJAXm2bxfhrJsBsHHFYDQOny
	G2de3Ju/GU4U/i1e5+wYpeix8kVI/yNMlYua5fzyxxRK6yXMEpVC5S4N2zYVogI9NVFxIlHX87b
	Q06FWuPtIk5ylJ6cwsWyK5JtG1DIxIzWxaMDKbVcnkH8dC/FVBkQcxJNIzg6k9eUe1KLVQmm4n2
	ZG7GWgPczpFhKGPTFzGKFc14NTyrKbPEh/PdwOXuULluJlxln3+QNbW4NadAzZ/FZTtCpeoJXSP
	DUcD48lQx3SDe9ZfLmUlNWd0xogPg1qDXo83GKh1NyFWfD5DBd3zUmru6+W0rpSwcxGujF44hLc
	IAZl0AJdrFPiRYMpw8D5GOaBHj4DQ/4TvAHxLPsaGINS3oVall+hJtcsRvDMp72EdRlN4A/S+qx
	0+vgLPUT0WgWHzvQVwgqDjDKQYZeSF2vVyxG4FLhNUJ06CDMEZRgJr373bqIuSyLlDY4ON5LDRZ
	VJ2POZ9wjIORokkwGgwM2fbPtTqku3xkTs79OwiN8Tc9WRXNI1/9CppBxGbXAiusnvboA2G8lmL
	OEZ31mv7dBnq70+9KgnS4aN1RwdPn3ewCzJrodPcm6wT2bbXa252CsOBedU=
X-Received: by 2002:a05:693c:80cd:b0:385:b8f4:756a with SMTP id 5a478bee46e88-385b8f47b36mr21872348eec.12.1795697675569;
        Thu, 26 Nov 2026 04:54:35 -0800 (PST)
Received: from houminxi ([61.170.160.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm70612864eec.21.2026.11.26.04.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:54:35 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	shuah@kernel.org,
	i.maximets@redhat.com
Subject: Re: [PATCH net v6 3/3] selftests/net/openvswitch: check that a failed set keeps the features
Date: Thu, 26 Nov 2026 07:54:18 -0500
Message-ID: <20261126125212.sashiko-v6-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179561838528.3135.298909861336575885@kernel.org>
References: <20261124145033.627044-1-houminxi@gmail.com> <20261124145033.627044-4-houminxi@gmail.com> <179561838528.3135.298909861336575885@kernel.org>
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
Content-Transfer-Encoding: 8bit

ovs_add_dp() returned on_exit()'s status, so the caller's failure guard
could not detect an add-dp failure.

The local v7 candidate saves add-dp's return status, registers cleanup, and
returns the saved status. Both new tests then report "the datapath was not
created" if creation fails.

v7 is prepared locally and has not been sent.

pw-bot: cr
