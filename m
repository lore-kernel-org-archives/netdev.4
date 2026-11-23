Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449925;
	b=OsI5ANolZraW0T1sV+1zXr+t2aSByKm3XyrEcKMdCCjkICcunN341kcj6Y01uyhAHn6j
	 7bCtuNuD1LWyir6oVgjt87phUCt2oNFXhLzTWh/w4V66illrJrevvdTsRimJSrItwa1O1
	 pZfLWN4YzOa1zJ0GsjRTKmYlBWaxlTvbfGva1m1IL3d+vd8SYEtHNT/6umK60sgw0zdPX
	 KSy/jHDLuz1xuKJmwiN6k2kaK11t9zebF/vgJKkG6srkxHqkrFnxO3iuZStge2ROM0yJ1
	 ozZ6XpLp0uETlSpRcB0OXPo7emrdLWrxL1yDErqpRQR4Y391pFV+97qFR3l1iTZLh0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=to/4RUyIAtFYVZVE9wuZmtMlOfLHqOz3AkKFX/7Ka5A=;
	b=2vPimh2PLLfgd2ZvOIba8hnDb5CWiM8OC+ItxsLsZnNnwYcW0F4lUvr5QnD8VT/+y0Qi
	 atg8itu1xl4G6q3lmVaG2dSnyczeYhHnPF0cBer4lP6JwlAIH6+OFR2lhAnrt/b3W4aeU
	 nS5WKEnQvGoa6XHkm3N9uX7818l3/N0sOr43zqBPY4WgGmmflf6ObOnWU6SlEveWh9vte
	 K5GZZphnRpr/dujocKyrOgF456auT8rActHcRtRelrUW223L3c3PxjnOvUJSvDQsvwhgT
	 9M82bCg08MTx0RlhQQcBQ8g/h8WlfOdTPZNzF5pUreyrHKbg2uHznCuuIrM21pV4S3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ckl0czXG;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F26606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 16:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7F26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ckl0czXG
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33fb4680717so9487513eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449924; x=1796054724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=to/4RUyIAtFYVZVE9wuZmtMlOfLHqOz3AkKFX/7Ka5A=;
        b=Ckl0czXGabh08tRxLi5peHhbgDXJjrZQyzjudU+1ueCXHZ3eP9SnTR6deRzWzCe5ju
         qRkx4J0GtLur8eXmQEHsxEPTD8h9+tKzf0NpngB8xk3h5urjgOGd57c+ohmT7qjzSEcB
         mnrnCfm6e8jjx2PWmy7SrHXzPDbCMYoWBjYKeBxY6kKDAYP3vV4kFAorZTdcvPog5Dn3
         N6giyjnZK3l41PxPT+AYJ+a4uBzYegBDQpMW9TUdq2T5h0HZsBA4RpL5Shse1PlCNStV
         HHdMB9PuPYzwq7yK4sjMVPksuoxfZhAs5r8TaNVBozQZTdKBUTNmoxP+9DiUSdCN+ZWa
         PxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449924; x=1796054724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=to/4RUyIAtFYVZVE9wuZmtMlOfLHqOz3AkKFX/7Ka5A=;
        b=N8ILyc+GM/oS/GvVJYw10ogJVKugNaIEIQePRqr35Yu3Jd/faVVQZbYQ9UubgbhPOL
         zlFqm6Lt0XhVlG31T0G+E6itlLONvfFUs/Zuunsmefb5Z9NXCPVwwCDhK7qykB21nQ5b
         nbO6U5tBWSZtVgolh2D32WreC3yDJiQVvodm8fzhf6OXbjX1nQU6dnK7Z6b5ODHc9U/N
         EvMjVE+ORm3WBhY/pfsL3b0TdruRVhExRR3PWAjp8kZh+jevuA17u5GIFp/QG5XXpT3R
         JfJZ6t7GTMVJY/xePqgd37jrpJLm4T7of2YztECxxY1+XLNuk2IUmAEv+z2krsZNGYhD
         xn3g==
X-Gm-Message-State: APuU4Z/oxyB6hEGkjmPQcFsd2t/+lAogKNCCqYwD9/3XPcmFop7UzHVC
	JZbKSZh8H4np1x6x4dSSEQAQdCH5nqdP6IPUNYFSlOdXarclHbr7iBxp
X-Gm-Gg: AZFdTZepYsHy3H+/8ATjqDZByxo5WkOkE0ywVzkKSQPM76wf0PU5SpVoXUlJ5kbDCGG
	slH7mL/3dGyLsV38LkUNgDvcPyuF1UNVi+lMwMxvYpvxCNGLDQFZSG9UfUCd0zv4zbxwewctvDD
	00Shzc4SEnDPJNmnnMWG4lkpYLhv6Def06oVTFNoK2cw4k8jxVSfmHZIfpSXRXW/422osDPiMhW
	OgCoWdksAif37ciWGIk9L+XHMc/o1AVMqO7DlH/3cwrDuXLMfeJ2jxG/Rw9EO7Fe74t7EPM8i/v
	H3rSdMk0fzcpsdfw7/+IiXWBBLHsdHtJ1SdsZw0dM/b0VUzGOJKIRc6ERMRjhW4N2YGrH1nx7Nn
	94djFY1PwAS8YMHBpWBP8d7JQG3F7GR5O6gzTXeEUaYUPZX+g9eWjttEbZk3PvR1kvdfUXFh4Gc
	/cOzHd/9xrs4TFwAI4dzg0H/RwhsBdrnVqFeJonZKsbn/cfbzGolK91YAgZmGfIwoehCjG/r4cu
	I7HH2ZONMq5qU38MF8hciVehPZFwM7Du5qooq1JVBOAi3swD7w=
X-Received: by 2002:a05:7301:6a03:b0:385:556b:4df5 with SMTP id 5a478bee46e88-3856f94dbd3mr17522690eec.26.1795449923905;
        Mon, 23 Nov 2026 08:05:23 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm39532395eec.6.2026.11.23.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:05:23 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH net v5 1/2] net: openvswitch: do not record user features when the change fails
Date: Mon, 23 Nov 2026 11:05:09 -0500
Message-ID: <20261123160509.3226523-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179533258016.3135.15287628134252460635@kernel.org>
References: <179533258016.3135.15287628134252460635@kernel.org>
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

The Medium finding is right, and it changes the series.  The single read of
dp->user_features in queue_userspace_packet() is a separate crash with its
own history, so v6 carries it as patch 1 with its own Fixes: tag naming
aea0bb4f8ee5, the commit that added the second read.  This patch keeps
35d39fecbc24 and is patch 2 of 3.  The cover says the count changed.

The two Low findings are also taken.  The Fixes: and Cc: lines are in the
trailer block now, and the comment on ovs_dp_set_user_features() says only
what the helper guarantees: every write goes through it under ovs_mutex, and
it stores once with WRITE_ONCE().

The plain reads that remain are on the receive path, which takes no lock, as
before.  The helper now reads the field with READ_ONCE() too, so both sides
access it the same way.

pw-bot: cr
