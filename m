Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026452;
	b=0VWDXijRK0now6maP4V+NfbD2M+iOOhzuzCrS/dZgx/20PTsnGmxfHwK0HSrB0Y3tkeU
	 F0Cn/w2Af2NFjlr89HuDScbi2i+6M2Skrw7m6/NmRbMXFrZdhntYwfdKS9P22LG85ahdD
	 GFRyXIPrS+g+B/PsxsYZqcBxcW/QH6kW+wR262caK3KucD8z3sjEHUUlHOKxasI35BEpg
	 KNiPin98TGRd2G7FWHQDWlppOgp+MHYgJTZowlsW44QVA2tKbUAMv+v6BdZKf/+Rxn97s
	 ObVfj4qP/8xjFKFCTQePRTCHbwfyHd5/41uH2EKs2wheCNAMJCycidKsEc/d0cDTtnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wA8d5hIKD/CZAR1awD4PWn450Yh0Q+o9r3zTMlIDXBg=;
	b=NzChcYUiU1rXijMXlU2qzy/y0UACvnpWsZ8oCShJvxxzd3tsY36qx7C1AgM+HecC+03u
	 k2yWc+u3nkNI7WB1pBSlHRTICztAr5BvKJAsIKlZ75T9MUUnqEmDKrCvcmRQMMmUlvfry
	 tAr4W4eoIulmyq0zHb0Q3FyrHQ6Oyg05TV5ej3s2JylU7y5BQfR5nj83zjpSFD81KA0PO
	 wOjztprjwEFhH8I46bR/BZddcnV8UDOTdD3MFlKed89nzqGb8UsRJEnzjUvQNy+Onduny
	 IHArry+SemIUpyL0hXx//maM2yQuYyMCYp75WJDMBAWIyrN1Pnt+ebNoNejpKBTRPcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fWLxt5LK;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047C0606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 047C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fWLxt5LK
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ccca948203aso975702a12.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795026451; x=1795631251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wA8d5hIKD/CZAR1awD4PWn450Yh0Q+o9r3zTMlIDXBg=;
        b=fWLxt5LKpRKB6ATNCGiw0SEiTlhqfpY0nRBIxcf4uyAkzC1/jXTfIQ4edxPNrV+d48
         Ped/CbpqPrS/U773oNQX5mHaK3pZd2moxMsxWuG8ZKzLypDR6kfC8mX5E/U5V+a5P3T/
         RZCd85yxQMF+y6hC0Nq7vdhDxkVBJg9s6Fi3M1PJWTGv01CGzaSdqA8F9djuxTeR7u7+
         TmoFOiVE8/z61eC1CcYHbTqWanWQHdHcIPoeyy+HyojmMM6NoRpZoYFG0owWUUrxMGr8
         QB2+nrAkTSrI5WZeDQWKZYekHHsWja9lX4ngTMSfqtp61qC44FxSiLwV3j6lujGVCy4A
         lzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026451; x=1795631251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA8d5hIKD/CZAR1awD4PWn450Yh0Q+o9r3zTMlIDXBg=;
        b=YCQU74O7dA8OzOnf4lQlGMz9RWALRgNWgTFVn1uvUFd3x7QYiCwaDNVajFzeT2ehZx
         42zZUTpLFp1ydODlAPYHVgovm3EtmujaVgfdxSnMmVnqDm6FW4gnMMKdaPKEH7qXpuB2
         FHguDOXzKl/ovWy9IeoO3oj/7wUKzGtMqMIFAZH2KDKc9oQ9RBbsP8ma/aMzi/72kSfI
         QwTPvmOk3GfW9Z0yQ6zxd7Cq0deeDAvayd4Jo0Z2JJ3zUDLdI98qw6jutoKPYMEb48qv
         ntNCbVLKNNKbZ3bEHz5siGceRQ+hA3zwKGXYUmlo0tYxGF3DEjEodho20JgyU6VGnVsJ
         0NqA==
X-Gm-Message-State: APuU4Z8P1KkqKOUFdMQeIKegJkbJquYzexCg+e8fOzgL0nf9nHGgwolF
	n0N+UvSciXEG3iR8Ia6OiFFhCUPSYN3k5H/BhDBWbw/n4SnCFM9o2++OqcQro+TJLmE=
X-Gm-Gg: AZFdTZfaPWHxSLUOL/dnKuUTU5AsQ2BYEIhZ3UoqxBgS2nIhJXivd69HKy76mlLt5L8
	bVxfi1OBh+HK2TrhMbzWnbER4v0+TbCIQVwczTwBJjXp+0z563shWBAAMNVlGUMD86Ekl3ChU1/
	6L4SVG9eD91dbPGZlu/j+hLpVLjCHTVehym1Byt+PICUkXBpnYXi8fPTEQN4Z7GNx09a0F1WPO3
	t2b/KlzmSNzq5tOmb7wIKsU0aUee/RCkjRbYsaXSA42pTd3sf/M3C7bHFG4XXfFDyKF5ovFsRUQ
	uCVlyU4twMCtyEnOv6Lt/HIUUw7JFp8PGpk1xiYZ+A6j6ztnHu4KqMhAMIn7dTRdVf09zMXeCrv
	lc+V+FP4JSUKSOp+t3VDSNPdkcRirn/3RSh52RX7bt+Z2KejW9nsOxzdkyvQz+ROcLf4/9aX/az
	H6RClJ+BImDwz7KDHDGEkBN/NJYkc0M8YGWg9K8w6BR7dAZY6wqLa2FoUH7OB3xnrytp5Xx4wdS
	YwhvMM8p7rdYltWj/OuUX4RsgFyQqhSgGHzbNBj1RdaG+NO9WGriSpNqQtpwE1kOToGEgisytu/
	bZgFoy3JEI6IITdhkvT8W7sFgNQJMd1VQHP/Q3PqIaCxvqcs/HclPOY4ncvRJz0H5/0jJoD4UYy
	n2iyjsQ==
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr3137248a91.6.1795026451247;
        Wed, 18 Nov 2026 10:27:31 -0800 (PST)
Received: from stephen-xps.local (c-73-96-252-35.hsd1.or.comcast.net. [73.96.252.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6c15c3csm411408a91.17.2026.11.18.10.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:27:30 -0800 (PST)
Date: Wed, 18 Nov 2026 10:27:27 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, Ido Schimmel
 <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Kuniyuki Iwashima
 <kuniyu@google.com>, Sabrina Dubroca <sd@queasysnail.net>, Andrea Parri
 <parri.andrea@gmail.com>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Willem de Bruijn
 <willemb@google.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/3] rtnetlink: return EMSGSIZE when first
 dump entry does not fit
Message-ID: <20261118102727.3fbb89ab@stephen-xps.local>
In-Reply-To: <av0HEABXXzKVNnoU@fedora>
References: <20261117221538.184948-1-stephen@networkplumber.org>
	<20261117221538.184948-2-stephen@networkplumber.org>
	<av0HEABXXzKVNnoU@fedora>
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

On Wed, 18 Nov 2026 10:01:52 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> > Fixes: 5b4b62a169e1 ("rtnetlink: make the "split" NLM_DONE handling generic")  
> 
> Should we keep the Fixes tag or not for net-next?
> 
> Thanks
> Hangbin

Yes it is fixing a regression, though I doubt any user would bump into it.
The commit referenced changed userspace API behavior
