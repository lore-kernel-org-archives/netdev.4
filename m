Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478933;
	b=KSI9bcnqgN0ShZNkLgw3jBIDJ4OWn+r/8a+amP1Pt3RIBVRyDB4rfrcmN+eKD8kUGcwV
	 koIFghxeIk+WhJjd46lsocnFWhcuZAXaj+ScS60u8w8EwexrMnPv/yPdZYxyxNBKpvb7h
	 ucld9Z1T2RzXovkbHH1QEg447bckGBHHwXVR/N7wukqMh1JKM8s3wwbsqiUhZr2cdXPJc
	 j39gnNJnstrXeEMtq2ICjToD09F0hPbP+LfVVbNFkUyYngRxdpq9B+nGmnN8A9PxSyo17
	 cfBNrucQ2s6w3UFXbse4fmn7G9oTYYG6EAtRbvmL6m6bMrxbkA7lrfb+C+7QqTAmFTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478933;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RBWaWh++9bAgJ8l4GJpqYwLzmbbx9SikCJPmdYDpcA0=;
	b=Eqa6aGw0yGSOoIbz1vAT2Mf55F8yEb2Fn91pefv3VA49XYXdnOWzb/nX+aKhj0kwuFs6
	 021KmTvX4ZOKaMqEFpeOb7d8BDg3/G0jYnMV8M3HD8IkUGcYvoaC7yjHO4kp5hjYxhrVh
	 eTix9zvYM/WLSuwSZmew2IgTLH2JW8TkfT0mlfYJs0HWvb9PyqE6BtpI8wvRLmjPONFnx
	 oI1+8rsWiDxdkKj0rn6+LK+p9QcOd9X4yLz8SOP4sinndQTevZBKS1mThutw7VFIHQ1HF
	 1o30lA+ySI4P0KazS6xlvhOduz5YLkEXPIhF0BYt9149n8e5p9JJzWS2FHzMIYRUOog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D99606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D99606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4d86f5328so25795217b3.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:08:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795478931; x=1796083731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBWaWh++9bAgJ8l4GJpqYwLzmbbx9SikCJPmdYDpcA0=;
        b=dabbbQq6bOyRSZLtwH75htgTB9S1/6BkYS9inQqMXkC+XQ+DTCmHjJyEkwTTXss3L0
         HtILazQADs4Sda1bNOLA/066w+zmUkE1eJZvzF0ABLY7mev9DJ/QlspcPp3hFAqWW75A
         D+JRL8rd2ddwIXakeTm4KEVbPedkq9U06D5XRuU/1NbwbHDV3a6MU9McoRoW1bhJAJlk
         nTCuL7A6Ez1DYzHleYMWWfwN+Q2hYhadXn5oOdXX3wkObZi6dZ2xBdF6Jy/B8xmfrxDQ
         A0/+91tFOOl+4vty/Tm2op7Fw2nOa21bTA56pl0NqEaf0r6pVHOr9eq7bwm7F6rZ2/ak
         hciA==
X-Gm-Message-State: APuU4Z+TW7Lk3REYd8O8Qy/+qpPjvOzVXfaC7jSejTlRMQFhZXEJycY4
	I22L6FT0ZlKozniS25erpO8a3aUfPDU9YntLGjdabyvSMcLVMMXPTHLp
X-Gm-Gg: AZFdTZcSg+KVwDvS7w4v5CdGOI6UgULVoJjNG8RHUeQ4/MJYDMNpIHs25SSNI9yszrE
	iwcVbtew+z0r8V5V4ABloE2vfzwfvJwCIwL9r8eWZLa9go8dZY/vjPqsqm1bjSdsPu3fZ/sQEKE
	d1W5IBqldVNwjgCoNXIUWKZjlsaW3dj8gYZVH8E94bEhBNbt0qbKcsjvWiXEOQPSHsql8fQPbcw
	ohW7/EMJBoN1ck+G9JWyy53gDXcZJDYX5n8c7lk95tzC/OrEzYzNMy1213bUlQSQ5I3OjXl26fU
	yx+MqmgJ/YdnqGAIw1/EdICwulZbyOZ1gS9u5sokZE9w/rvbzFzHuMD2TbIyJUQYbSLUyD5nkCT
	gJvgrS8I9LBv4NtfB0gEd7QwkEGiu1gcfGGyNVFmsNoDly+3b+Wb0hIJM1/iO+tgXUB6z+jky5M
	DFbMerS9afYe9SLHgu3NCUkjH2QGdFF5Q1rXkTW4jnB3IPoip7zb82tCGMmGD9Jb2C7kgAJNtSf
	bJfrzRYutwGAbRtDDvNuxMIBeDBosGYDH+nSYpEhGfyWGWAvWNswgOIAPoXxOZkBuIRiqVH57em
	4bQntRY3oKSkK4wD7WIYYGFq5AtT1EfKADSxzKtEiIwbxsZ+B47IQySM/H0EXDGc53fvyyvdEFr
	2zj4LCNynXyt4PpmQUrdZEsnfiKT0W1E=
X-Received: by 2002:a05:690c:370a:b0:8b0:cc24:f7b8 with SMTP id 00721157ae682-8b520524d43mr49786797b3.69.1795478931674;
        Mon, 23 Nov 2026 16:08:51 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202dd36dsm51470857b3.26.2026.11.23.16.08.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 16:08:51 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v7 6/6] net: dsa: b53: fix mirror destination and source state tracking
Date: Mon, 23 Nov 2026 19:08:49 -0500
Message-ID: <20261124000849.25327-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119190348.2317702-7-florian.fainelli@broadcom.com>
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com> <20261119190348.2317702-7-florian.fainelli@broadcom.com>
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

I tested this on a BCM53125 over SPI, with the series applied to v7.3.3,
using skip_sw matchall mirred rules and the switch MIB counters:

- ingress and egress mirroring to one port work, and stop when the
  rules are deleted
- a rule for a second destination is refused
- with two ingress filters on one source, deleting one keeps mirroring
  and deleting both stops it
- once all rules are gone, a different destination is accepted

Tested-by: Joseph Telaak <joseph@telaak.dev>
