Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795549437;
	b=gBwLpGgdXSNp/ChzHoiLgaBr8bI30XrLu9aQYBl5jd/Dq8ich5C3H5scEaE9OvmY9/gk
	 NUteEPTZDwX/9Zy5AuZT1WeMztCP+1eD0Uj401nXZ5XSs+UoOLQN9s3aJ6PdD3FvBtDM5
	 xTZ0QkCMhyVUPkfn4Q+IlLMLcljBeLPEbuD5uiGFnjZkgd+EBH6d0hRd5BOPjbDNDnynl
	 BCk/KnnFJKW6KT2CAor/Dfnc+8LK4hC3pnbSXoo2cAG6THXWVms7zjVuLe8Yk92YpG8BA
	 Wsv+n1j4MLxocS8KtCFc0ZDMYebXhJE9O2JgunUIZAWsUT2HkKjywv/0V3dv/DJ+whQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
	b=REzCw3SJdFo/hpN0cp69/y1GQqy4zaMFL0ZnSV8LWXqP4qMts5WQL+XzuCXKRWmhT8Eq
	 wvzixAWqmhn7jcrQJh86+esK82Hc7mz+eRnQFkQvQ9yCdKFqd6sZtuXUxc6A6bwCSm+YV
	 EQdBNawqcTO6W3tsn6NKLyv8DFqXwUJzsd4UK0brci3852KKArbDukEM/GtvMFg4No1Nc
	 R+WklNzR+EFIayBbPLbQ0wPRNRLgvF9zZ69FqI/RElZlH/Lwlx61DkteMstYkDsLx9yTX
	 gHiRh/q2bOXmN3c0L8M814P0TTHY3Pn1xe5Mf8rQh/LXVflC2xCptXae0Qk1sEYdOZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAGtHY+4;
	arc=fail smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835EC606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAGtHY+4
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso5771875a12.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795549436; cv=none;
        d=google.com; s=arc-20260327;
        b=md4xvtbsdIbY2/oT7INCPtKqNbinZCijhAQzVEi2pjtlshdaFSLmXuwN7WJvHyODtI
         HUvRQym1JislTLcvZpLYqpKmpEJEo1SNTiLt1U/9Qgb8ZPtpzlQNYr7bO4aYxrG/A4K/
         thq3L2mwCKIcpaFccePi4iOD5vT4ydqR2GLDlzWf34Mcj6oq0i7SbeJjzpDOWMY+rQfX
         ajk3G6+766RyCJfZkCtWG/8Kq/CFq81cC7dbpo1sqJ+eF2B1O8zgrBRe0jwdIUjJxXcG
         TD1ROJ/Oii0MZPqvF8TDgJxWO3ESBHb5VCCcdK1CgwgZ/998qGY95tezxyfbIWvRkpwF
         7x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        fh=mP8Fk+tDmie8rDN4yLCX8DaMyaGYftaw2CzBsWJNtCg=;
        b=XGSublzNG6UrkhtWT5bkigaW2PC7uRNH0MvIqkLk7cHfPsXOz50+rSobKxnux+F0NC
         FnSCm/99DlbLObK64llmFrTEJ5/Fs5duW5iuQP14cV7LrDrl/oya4nFO6kRI2/zlImKq
         vPSAl5OhNB17kqu/YWJdCqSB5InY2ynzLB0HL30MlOQ+wnd/s+u3mB/IpIUBUNy9mzyZ
         JKuXQ92AvXk8arFWol42TlVbAyXk4Jd9RJnsxohrKO6YJXrA4RIKNxpuO8sY24mSdJh3
         ULm2PX8r70RLWQct/iYqgVLmPi7UhbfH1782R/jSobRNgEM68JtF3/WvQbZq3ENj/IPQ
         8/tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549436; x=1796154236; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        b=XAGtHY+4xaUrnSj0AmUfbCZQv/JYYTKVznKj7XFa4ESf2ICNPobilYb1TiLfWjBzic
         xufpRUBUzROsFWPm1J8YSzfA/34w/PyALXgPwV2xyrHyXKn2Os4KGwHd3BBzDW/HYrJU
         JHNDyYjuAJr4adyDNx+VA4EH6BZDkhK88jRggaNv1jjEzdJOVr6NO3s5J7lkcWO6sA3R
         CSaoRHmXrDpN7c3+Z3KfuGbTF8Ni0E0XJFeWe03pnyNvIpZuu8kb/xvbRWtmPxyJYGj5
         0MSqUIEuvEflSX87IlN9NEooP42qhhlhgVF8Vz6Xn+ybEAD+lG8TH/vaMvGT/ILySZOV
         FQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549436; x=1796154236;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U7/bYvTfzujTfFLDcWJrROauuiZKLE7VhrQBX+35cmk=;
        b=mu6wr8EOSSn0l6Ea5EYETV1oA01wvsCP8I1GhFjVUHniwV6NB8TGf9vQZJ6NmgQBW3
         iVbqyg0hG0+JDyrUUQw+FZhjJlEVVYsvgE4GWDQqTLGY0y1z1g7uJ7bVyatliqNOkPQR
         IkcJoh2loVL15KAwYxajl2pS9L8ikORPBHPAAA1t2NRHHlIDIn+CWRxRHbcEjqv4dywI
         /wF9KP03SdIQwPLE2ELIZQkd6pw45siZBcBazVHv9Bb1pB4d1qdCEW9a3wns0fZ6L0Q7
         NCMQSgkyIg9FTG8iNpQf0C4nG16iDRYMrVyixEHupsqRDbuuGByBZUZRNjg7tZ7qM9Rb
         XFUQ==
X-Forwarded-Encrypted: i=1; AL+hErFvZq5PfuYaGzOy+Tu7rrcWbHTpr5N19O9IFLE9bdD6kmkFHAkKjgdSfnOLA//VjU/8/ru8dww=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4G/NfErwqdaplb3V16+AjwYiAQP51XuPweB3ez3vFI4RQlNIl
	2Ieey4JJROFJjc5v47NP8cXqj/cMJxcRadDxve9f2YirJVenjeF3kUCCQMDKoGCTRmJlHx3V0Fi
	lheBYNZh4qMu7qCyAlCT/A7kjnvOeLfs=
X-Gm-Gg: AZFdTZci/J6PtGkUKMOyHQS9efZHTK2qG9cAjjeKiqi21CQXv1eeDiA4Q+iEhIqB5yT
	7b0PoyqAn0edg5jDDm+RnV/qyCXOMf7OU9Mj+wUoMaY1C2fH39gqpjm+cZhmtB/HAi4zjv6xPu6
	Y3uRv2bhpD0gXXl/1wX6AN5nUlGTUHDq7Oie7S7Abrwscouz8UYC8j7E6S4J2sq+riY2hs/bCCD
	FJM3BTeONZuWgp+IfYeey6q7ESP0nKCBerIUwCnEE4MPql2HfxzmDSp33b55k0KQ1jXX14r0RgC
	fHMc9xGBsXZgeLeS0Uvdq6ukmR26b/7ZGY7abaPhGvCClvw4ek+OP7NbzAwFcMXBdgqt7pUG6TW
	LwF8aiYnmfpmyz74xEEvW/FUEESmc0clnA/UdXHOj3+G2lee08lxH0MMzw1fLLoBsyMTlqQ==
X-Received: by 2002:a05:6402:4416:b0:6ba:a7af:b80d with SMTP id
 4fb4d7f45d1cf-6baa7afb918mr5940678a12.25.1795549435824; Tue, 24 Nov 2026
 11:43:55 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120174341.35873-3-juanagusnicco@gmail.com> <179554500253.3135.7129341529911265513@kernel.org>
In-Reply-To: <179554500253.3135.7129341529911265513@kernel.org>
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Date: Tue, 24 Nov 2026 14:43:44 -0500
X-Gm-Features: Aa3M54q0ymEgH2iGN0KHi3f7zWEwzt_ONQZiRG7AaDrvbqatZSJsXwDKB0tlvzg
Message-ID: <CACQ4AciO6ESeDt4M1ifVgnVVKAvE=c3n6_aqCQ4kjpzpJe9ZNA@mail.gmail.com>
Subject: Re: [PATCH net 2/4] udp: Keep the bound device on disconnect unless
 connect() set it
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, kuniyu@google.com, 
	willemdebruijn.kernel@gmail.com, willemb@google.com, e@erig.me, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series fixes the universal bugs, where simply binding a specific
way makes a socket vulnerable. It does not fix every instance of the
mistake, which was repeated more than once on every protocol I looked
at. I was already aware of the L2TP bug. Its fix does not belong on this
commit and I don't think it belongs on the series either but I will let
the maintainers decide. Also, the issue is pre-existing, sashiko
misclassified it, as usual.
