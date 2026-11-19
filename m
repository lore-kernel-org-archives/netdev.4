Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109734;
	b=FI8K+fwrLhcLnOLtG7sQiRvTQMho7wQAo5K+RfVYjauZo/iXDt0NfXXdSQStiSv5Wv7G
	 buzz/C9E+0DLSj7Z74QGxCmr1u+N9Kf9vj5ft1MDGdTOerj2UMfqlir/gGe3G0IvfyOUi
	 9r/MK4Da0WbN9MJ4aPUqE8CtkzWVaUvOFGh/KFhlgz6Ic6Ni+5lXFzo2SweVF269k1IrC
	 XUiRSo0ualdWpf9IQcmVJCgProWiFtgvFt6nMDGsopeilCs/gJhB9XUE1HFsUrvtXFsgX
	 G9lfYoA/uGCePxTkPLeITdBwfSLk1p20ljswLugwcvcRBlYX24e75JA35EijgmW7vkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UVelqqyZUlthOE4RjrIFuCnQdBBZv2WlhfnRBIbz9VQ=;
	b=xjT+APbgDhvxrZ38UR4Rpc5EmSqHK/A9dFJoULmhaH1KxoF4hst+oeo2vusB5bGPu3Ao
	 RoiChOHoaIN9wgFabtC0LMvN8W6k+Zf91k5X0IdwOS2GIDzVmW14e8GrKwrT6qAh/9bhj
	 tz7dDM5GSDvMIkz/vAa0LnR65Q/tCxj+LFXVKFnA+44NIO0CyjzB8cIhuRv0lqOnvMNec
	 BPhFF7d9FrF/R4YibBsaXcBTTavZ5GlBO2spPEFPF4dAO46JkVx22Ngq/CLmNP7PzgeX7
	 Pqf+ezQzHEh0BKAmW3sf+TQuSztuU9CGKcTmsR3fG0W/bsXzc++ETU6eoWt8Z3slF5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SyN0u03m;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32712606A326
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32712606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SyN0u03m
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so46552a91.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795109733; x=1795714533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UVelqqyZUlthOE4RjrIFuCnQdBBZv2WlhfnRBIbz9VQ=;
        b=SyN0u03mvEch5IxzCCRJjU2nRSdg9XewHHFuIIGOyx/GyOHJaP1rfZuaSwlDOUKzaM
         trpXeaKZiMc7BGgNmlo9ZBp8uK/adcpiwYV0+5lfK2ckmRY/UAybfLv0+aXXCHUF4bJn
         otycxOfkHcUURq74Nw8DpQQgW1hkJE1GUg4HZkGU++nK8ZxoI0kzBFkExBiJBEJV6kMu
         33okUq47EHxXescHxYq+L/tfVP5qmydp6QAIG6b1WqOZWx33s9otkkETUQ4G9QgORiJ1
         rkWZ6bSV/2/NBs4ynzWH7GpbWtUGrYWfhdgOzNpZuzZ3fFmJ1lAYY+fSN7NGk2YcTtWV
         E4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109733; x=1795714533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVelqqyZUlthOE4RjrIFuCnQdBBZv2WlhfnRBIbz9VQ=;
        b=j8tN5zthiA0Kk9iCpwp4GHzI6gXQLBtvOHiykBnvQk5yU/TPvJM54SXVnqtjy+uhrX
         Mp0vlhS9pSGibOINubP6YPDp7qi1KVz08Ruq/pFTWIK5cM7nHdaO0Khko0ubfVeTk9Al
         RyPXI5qBIvleNDH8Ij3m5Dbn5/S4ng/DRkLejQfyR3+fdOHMMo9RiN5cued7DXH4Fmwi
         GqDfTAz20K+kvfCxA/eWeK0I9ZEZpwB0LuMIi8POb4VXnu1/OPg40jV8nKAKPxInOfaH
         DLuBuK9tU8pMmI+EqTLS+6FmtTbN2hsjb6NEPhQZD/2Qx4XAh8d71Ihyf547hA0keCU2
         RCAg==
X-Gm-Message-State: APuU4Z8EyiM0aDMGgtlGWtF2/HSF7iKnPj1lt57gh14J313X2HEu8fXP
	AH1hbDp8V0EG/eIaL08ENy1b7y/ZoyOJgtYD0AprWjLQtI0Xn9CiJgGFzNBDR+1VQMI=
X-Gm-Gg: AZFdTZeNoDJoXtSfNhKsIsk7NK29gAA0+cRUnhbxT1EMYro4w3RAn/3OI45wFkSfBN9
	MTTaMxpo2rstUZa6wUB0BXY8yIySIItgJYiiyBqn0fpMonjkYxWBKuVBnr2tLZB0/6IjXjjVPyz
	ePPvZ5XHN4WbtstPQr9SPPv/8H0NJkWQPWYCi1ZJsBaUXDYRrMQb/EOgmlwIrjqEBmB4Nr7ShFr
	3KdjXH5SwZRhIY5dGsQzxeI9CNqTUnwyQUqL24BwmL33JcyrLtuSgYFQa9GcQbKADQByw6VzCoq
	IEPqRLfu1B3VjUyIm13SBTl4GPm4lgcYoBgKmiHb86xvkuJXqRaLqq8RQcJnEoJjPiecosxnknb
	wRVilJU/3pAzdw8h9yWrikBohBub3lWkzdJ3EF4oi+snXN/iCT16WZoW1lVet5FXVYZgLbluq+q
	0C5KVp2/LC0sXKqydrfzIt5R9N0Kn+nl9TX95CJpE+4sSWy8t72yJzRDfLh7vEQk7OCxyd5LC87
	moT2fB/gDsIH3ouliW6pxZEETKq9loo8cOcXDdSz/4XD/dscEKcxoZ/cHgZrd3Dx/IrljfLs8dm
	+B3k19SHoPYR+laalf2W83pW54nJ22Yp2SX4rpOFBwxIMNuV5P+bgXJvqYQGH4DKTRTXxuyCHrh
	pa5vByJ+hidgpUBfG
X-Received: by 2002:a17:90b:3d4d:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b41c956552mr55683a91.44.1795109733459;
        Thu, 19 Nov 2026 09:35:33 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d1361fsm3358377a91.6.2026.11.19.09.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:35:33 -0800 (PST)
Date: Thu, 19 Nov 2026 09:35:30 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, Daniel Borkmann
 <daniel@iogearbox.net>, Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH iproute2-next 3/5] tc: remove eBPF map export and exec
 bpf import
Message-ID: <20261119093530.574f9a4e@phoenix.local>
In-Reply-To: <CAM0EoMnGzNOCBpkXy5A3DXeEjWJwyUbj3As=Htc5E3QWtUXrCg@mail.gmail.com>
References: <20261119001539.2868072-1-stephen@networkplumber.org>
	<20261119001539.2868072-4-stephen@networkplumber.org>
	<CAM0EoMkLUeJdzCBxsknqxSKAZ2Q7WhAB9ifV_tKXne4fPxY7YA@mail.gmail.com>
	<CAM0EoMnGzNOCBpkXy5A3DXeEjWJwyUbj3As=Htc5E3QWtUXrCg@mail.gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 04:50:09 -0500
Jamal Hadi Salim <jhs@mojatatu.com> wrote:

> Also, reported by - does that need an email address?

It would have been to have an email to list but there isn't one that means anything.
The OSS scanner just gives
a big report and want to track bug fixes versus original report.
