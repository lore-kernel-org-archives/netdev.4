Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508840;
	b=AT2a7yrdV257eygwl1VpNeMegskZTeVD1lgiGG5cb7k9koaDgTWJvSELPc3K195Hzuny
	 YDO6gBzmsRDqFIPTfPpj3jfvOwRs2mMYrksY9z3PSrasjPQCA+MgZsDA/VP3yGavRznSu
	 tShNWcBWDYx516QeNbIVdZ7V/EkKE9YEqiNOcRlYVsC4qYEkf/aIlsprmtvBy3azYdl1h
	 xs5bIPk+CXeoJZRfgodbntALRFGrxvMbTCZC+Z8SBgMWaRB8vg/HFquYqo43KSXTwlvz1
	 B+EdHo/jAoClxBPufcLIvCeyEmY+C1ZcTmZpMESXxRG4OT9Q0PTQNmrNaZM/m9nKHhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508840;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=ZWW4JoTl6P7PwiqYC1DkrQQs0nLQlzJs5F139zXifZc=;
	b=o8aI9SM+MT/dkfdzPGzEmCIfW6+08CnpttE5IaMycpwCA88/p5zzHMEBJUBf3M1j9h8T
	 ER1OSYD5cjHdIMJ+k1otOVqQSVqsLOlRjwml0ktNOV6jH3D5+Cu0rSaPlXNcZDYg61I/z
	 FpWi8D8wyHoKFraHrBckDnK1eCEDV19RP5RHtf8MBvVZYzypO4WcBQ8b84GBiJq2Fnb+2
	 NkaH4zSmIsqF3DeKlFdaoLa/th6YbfD+HI4AXfWTLoU5w7+Dyx3C3j2bFp2Xa69gKkI5a
	 Ic4GXxkSmSpWzkOfD1CFh04e18h5xkenLyrMf9EsetXKqpi7RxfK0D4IGhEq1Btn8fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.zgclab.edu.cn;
	spf=pass smtp.mailfrom=mail.zgclab.edu.cn;
	dkim=pass header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=JKHq5xUU;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DB2606A338;
	Tue, 24 Nov 2026 08:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3DB2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.zgclab.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.zgclab.edu.cn header.i=@mail.zgclab.edu.cn header.a=rsa-sha256 header.s=dkim header.b=JKHq5xUU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.zgclab.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZWW4JoTl6P7PwiqYC1DkrQQs0nLQlzJs5F139zXifZc=; b=JKHq5xUU9sdS8
	Zp70roUs3cHHhASnmFbYI2V7Cyl/6QIU82WmpEDivRnXAiaSXpXClXVRZHO07X/g
	7b+EiTztWHoVpToBXOy+hHoF5aNDLbWW6JSgLMIc0zRDnviSND/Qx+rSxv7m7sEx
	F30AMkl2lBHiHOPQVzMoG1JyjYwskA=
Received: from mt7530_series_00.eml (unknown [58.206.202.11])
	by web2 (Coremail) with SMTP id yQQGZQAXRGg4SgVrg7NjAQ--.65249S2;
	Tue, 24 Nov 2026 16:26:33 +0800 (CST)
From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
To: chester.a.unal@arinc9.com, daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 0/5] net: dsa: mt7530: fix regulator disable on teardown and error paths
Date: Tue, 24 Nov 2026 16:25:57 +0800
Message-ID: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yQQGZQAXRGg4SgVrg7NjAQ--.65249S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr4DZFy5tr4xKF47ur1rWFg_yoW8Xw4Dpr
	y7Wasayr4DWFyI9a9xC3WIvFW5XrZ3CrWfJwn7K3yDtw1YyF18tr1vya48ua47GrZ7Aw4S
	yF4kAry8uFsrZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq
	07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r
	18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5pVbJUUUUU==
X-CM-SenderInfo: pzdqwxbusqjlo62juzldeovvfxof0/1tbiAgIBD2sFSC8EeAAAs7

mt7530_setup() enables the core and io regulators, but they were not
always disabled again:

 - the disable lived in the driver's remove() callback instead of the
   matching teardown callback, so a switch whose sibling failed to set
   up was torn down without reaching remove() and kept its regulators
   enabled, and

 - the error paths in mt7530_setup() and mt753x_setup() returned without
   disabling the regulators, leaving the rails enabled and making the
   regulator core warn when devres later put an enabled regulator. The
   common case is mt7530_setup_irq() returning -EPROBE_DEFER, which
   re-enabled the rails on every re-probe.

This series splits the original patch into five small, independently
obvious changes, as requested by Andrew Lunn:

  1. Move the disable from remove() to teardown().
  2. Factor the disable into mt7530_disable_pwrs().
  3. Register the GPIO controller last so it is not published across a
     failed setup.
  4. Disable the regulators on every mt7530_setup() error path.
  5. Do the same for mt753x_setup(), moving the mdio irq teardown to the
     end.


Haoran Wang (5):
  net: dsa: mt7530: disable regulators on switch teardown
  net: dsa: mt7530: factor out mt7530_disable_pwrs()
  net: dsa: mt7530: register the GPIO controller last in setup
  net: dsa: mt7530: disable regulators on setup failure
  net: dsa: mt7530: disable regulators on mt753x_setup() failure

 drivers/net/dsa/mt7530-mdio.c | 14 +-------
 drivers/net/dsa/mt7530.c      | 60 +++++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 29 deletions(-)

